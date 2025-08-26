class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def index
    @error_messages = [
      {
        title: "Fatigue Error",
        en: "Immediately move to the safe shutdown zone known as \"the futon\". A minimum of 6-8 hours of \"sleep mode\" is required.",
        ja: "「布団」として知られる安全なシャットダウンゾーンに即座に移動してください。最低6-8時間の「スリープモード」が必要です。"
      },
      {
        title: "NULL_WEARING_EXCEPTION",
        en: "An essential item (underwear) was not loaded into the expected memory location (your rear).",
        ja: "必須アイテム（下着）が期待されるメモリ位置（あなたのお尻）にロードされていません。"
      },
      {
        title: "Rehydration Failed",
        en: "Hangover detected. Your body is requesting fluids. Please drink plenty of water and enter rest mode.",
        ja: "二日酔いが検出されました。体が水分を要求しています。水をたくさん摂取して休息モードに入ってください。"
      },
      {
        title: "Permission Denied",
        en: "You proposed something to your boss or parents, but your request was rejected.",
        ja: "上司や親に何かを提案しましたが、リクエストが拒否されました。"
      },
      {
        title: "Alarm Unresponsive",
        en: "Despite the alarm ringing, you failed to wake up.",
        ja: "アラームが鳴っているにも関わらず、起きることに失敗しました。"
      },
      {
        title: "Data Corruption",
        en: "Your memories from the previous day are unclear, and you cannot recall what happened. Please drink alcohol in moderation.",
        ja: "前日の記憶が不明瞭で、何が起こったか思い出せません。お酒は適度に飲んでください。"
      },
      {
        title: "File System Corruption",
        en: "Your room is so messy that you have no idea where anything is. Try cleaning up once in a while.",
        ja: "部屋があまりにも散らかっていて、何がどこにあるか全く分からない状態です。たまには片付けてみてください。"
      },
      {
        title: "Infinite Loop In Bed",
        en: "Alarm triggered, but user repeatedly returns to sleep.",
        ja: "アラームがトリガーされましたが、ユーザーは繰り返し睡眠にに戻ります。アラームが鳴っても起きられません。"
      },
      {
        title: "Fatal Exception: Monday",
        en: "On Monday morning, you simply cannot get yourself out of bed.",
        ja: "月曜日の朝、あなたは単純にベッドから出ることができません。"
      },
      {
        title: "Wallet Resource Leak",
        en: "Your money keeps disappearing without you noticing. Be careful not to overspend.",
        ja: "気づかないうちにお金がどんどん消えていきます。使いすぎに注意してください。"
      },
      {
        title: "Error: Unhandled Event",
        en: "Unexpected input detected (e.g., sudden visitor). System panic triggered. Recommendation: remain calm and reassess priorities.",
        ja: "予期しない入力が検出されました（例：突然の訪問者）。システムパニックがトリガーされました。推奨事項：冷静を保ち、優先順位を再評価してください。"
      },
      {
        title: "Desk Buffer Overflow",
        en: "Your desk is so cluttered with items that there's no space left to work. Try to keep it organized regularly.",
        ja: "机がものでごちゃごちゃしすぎて、作業するスペースが残っていません。定期的に整理整頓を心がけてください。"
      }
    ]

    @random_message = @error_messages.sample
  end

  def draw
    redirect_to root_path
  end
end
