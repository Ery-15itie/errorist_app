class ErrorsController < ApplicationController
  def index
    @app_title = "Errorい人"
    @app_subtitle = "エラーを出しても生きてるだけで偉い"
    @current_language = session[:language] || "english"
  end

  def result
    # 新しくエラーを引く場合（もう一度引くボタンから）
    if params[:draw_new].present?
      session[:current_error_id] = nil  # 現在のエラーIDをリセット
    end

    # セッションから現在のエラーIDを取得（言語切り替え時に同じエラーを表示するため）
    if session[:current_error_id]
      @drawn_error = life_errors.find { |error| error[:id] == session[:current_error_id] }
    end

    # エラーが見つからない場合は新しくランダム選択
    @drawn_error ||= life_errors.sample

    @current_language = session[:language] || "english"
    session[:current_error_id] = @drawn_error[:id]
    render :result
  end

  def toggle_language
    current_lang = session[:language] || "english"
    session[:language] = current_lang == "english" ? "japanese" : "english"

    # 結果画面からの言語切り替えの場合は結果画面に戻る
    if request.referer&.include?("result")
      redirect_to result_errors_path
    else
      redirect_to root_path
    end
  end

  private

  def life_errors
    [
      {
        id: 1,
        title: "Fatigue Error",
        en: "Immediately move to the safe shutdown zone known as \"the futon\". A minimum of 6-8 hours of \"sleep mode\" is required.",
        ja: "「布団」として知られる安全なシャットダウンゾーンに即座に移動してください。最低6-8時間の「スリープモード」が必要です。"
      },
      {
        id: 2,
        title: "NULL_WEARING_EXCEPTION",
        en: "An essential item (underwear) was not loaded into the expected memory location (your rear).Warning: Forgotten Items Detected in Changing Room",
        ja: "必須アイテム（下着）が期待されるメモリ位置（あなたのお尻）にロードされていません。脱衣所の忘れ物にはご注意を。"
      },
      {
        id: 3,
        title: "Rehydration Failed",
        en: "Hangover detected. Your body is requesting fluids. Please drink plenty of water and enter rest mode.",
        ja: "二日酔いが検出されました。体が水分を要求しています。水をたくさん摂取して休息モードに入ってください。"
      },
      {
        id: 4,
        title: "Permission Denied",
        en: "You proposed something to your boss or parents, but your request was rejected.",
        ja: "上司や親に何かを提案しましたが、リクエストが拒否されました。"
      },
      {
        id: 5,
        title: "Alarm Unresponsive",
        en: "Despite the alarm ringing, you failed to wake up.",
        ja: "アラームが鳴っているにも関わらず、起きることに失敗しました。"
      },
      {
        id: 6,
        title: "Data Corruption",
        en: "Your memories from the previous day are unclear, and you cannot recall what happened. Please drink alcohol in moderation.",
        ja: "前日の記憶が不明瞭で、何が起こったか思い出せません。お酒は適度に飲んでください。"
      },
      {
        id: 7,
        title: "File System Corruption",
        en: "Your room is so messy that you have no idea where anything is. Try cleaning up once in a while.",
        ja: "部屋があまりにも散らかっていて、何がどこにあるか全く分からない状態です。たまには片付けてみてください。"
      },
      {
        id: 8,
        title: "Infinite Loop In Bed",
        en: "Alarm triggered, but user repeatedly returns to sleep.",
        ja: "アラームがトリガーされましたが、ユーザーは今一度睡眠に戻ります。"
      },
      {
        id: 9,
        title: "Fatal Exception: Monday",
        en: "On Monday morning, you simply cannot get yourself out of bed.",
        ja: "月曜日の朝、あなたは単純にベッドから出ることができません。"
      },
      {
        id: 10,
        title: "Wallet Resource Leak",
        en: "Your money keeps disappearing without you noticing. Be careful not to overspend.",
        ja: "気づかないうちにお金がどんどん消えていきます。使いすぎに注意してください。"
      },
      {
        id: 11,
        title: "Error: Unhandled Event",
        en: "Unexpected input detected (e.g., sudden visitor). System panic triggered. Recommendation: remain calm and reassess priorities.",
        ja: "予期しない入力が検出されました（例：突然の訪問者）。システムパニックがトリガーされました。推奨事項：冷静を保ち、優先順位を再評価してください。"
      },
      {
        id: 12,
        title: "Desk Buffer Overflow",
        en: "Your desk is so cluttered with items that there's no space left to work. Try to keep it organized regularly.",
        ja: "机がものでごちゃごちゃしすぎて、作業するスペースが残っていません。定期的に整理整頓を心がけてください。"
      },
      {
        id: 13,
        title: "RESOURCE_LOCKED_BY_PET",
        en: "Your pet has occupied the sofa, leaving you with no place to sit. Give them some attention and kindly ask them to move.",
        ja: "ペットがソファを占領してしまい、座る場所がありません。少し構ってあげて、移動するように優しくお願いしましょう。"
      },
      {
        id: 14,
        title: "Error: RESOURCE_LOCKED_BY_CAT",
        en: "Laptop resource locked by feline process. System unavailable until cat relocates. Termination: unfortunate, abort operation.",
        ja: "猫のプロセスによってノートパソコンのリソースがロックされています。猫が移動するまでシステムは利用できません。残念、諦めましょう。"
      },
      {
        id: 15,
        title: "Error: Refrigerator Resource Leak",
        en: "Forgotten items detected. Ingredients expired due to lack of user access.",
        ja: "忘れられたアイテムが検出されました。ユーザーアクセスがないため、材料の賞味期限が切れています。"
      },
      {
        id: 16,
        title: "SYNTAX_ERROR_IN_A_JOKE",
        en: "Attempted to deliver a funny story, but audience response was null. Reminder: your natural self, without forcing jokes, is the best",
        ja: "面白い話をしようとしたが、観客の反応はゼロです。注意：無理に冗談を言わず、ありのままの自分でいるのが一番です！"
      },
      {
        id: 17,
        title: "UNKNOWN_DEVICE_ATTACHED_TO_BAG",
        en: "Child’s toy detected in business bag. System note: thank you for your hard work in parenting.",
        ja: "子供のおもちゃがビジネスバッグの中に検出されました。システムメモ：子育てお疲れ様です！！"
      },
      {
        id: 18,
        title: "UNREACHABLE_BUS_ERROR",
        en: "Process failed — bus left before boarding. Recommendation: initiate departure from home earlier next time.",
        ja: "乗車前にバスが出発しました。推奨事項: 次回は早めに自宅から出発してください。"
      }



    ]
  end
end
