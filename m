Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B407F12F585
	for <linux-media@vger.kernel.org>; Sun,  6 Sep 2026 05:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788673428; cv=none; b=DrKJMMx8uUylrG6/DI0NcZj7waqZ8eY5dt9NCGLtHbhQXBjz4PO0puouS39Bo3klwiluCmHbxrB1Pc8IYd9NfOMQzkBpf2fb6x4NyjAbID6EQXAlcZGZATIcQC56Nv+rawKhVoM1XfTqv/h2cDBnceuEnVM32XKbkE/fJvmCAG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788673428; c=relaxed/simple;
	bh=5HGNYVWbCiIfJ7J4KYDSWP1ixTE+58ufVd+i5jdsTaM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=nKscB3rr916/mIjjwQ9IQKlcSxD24ncMVSup6oscvwYDSmDr0EDQn9cA7/28FiqnAb+v4fwnUEXHAIHnkVabiQkwpbr+iSm7nIvcj3cBQDX/HaayxhUouUV16ZZLDz63ftEKVw8RxjrgSeDrWTzhFL9i5rJ3gmhGrsSy30f17eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 6865hcJ2016143;
	Sun, 6 Sep 2026 14:43:38 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 6865hLVJ016079
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 6 Sep 2026 14:43:37 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <1a140bff-57f9-41b5-844e-95c7b81edacb@I-love.SAKURA.ne.jp>
Date: Sun, 6 Sep 2026 14:43:22 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
        Tomoki Sekiyama <tomoki.sekiyama@gmail.com>,
        linux-media@vger.kernel.org
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] media: siano: fix NULL pointer dereference in
 smsdvb_media_device_unregister()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav314.rs.sakura.ne.jp

If an error occurs during initialization in smsdvb_hotplug() before the
"client->coredev = coredev;" assignment, the error unwinding path calls
smsdvb_media_device_unregister() despite client->coredev is NULL. Fix this
by assigning client->coredev immediately after client is allocated. Also,
add a defensive check inside smsdvb_media_device_unregister() to return
early if client->coredev is NULL.

Reported-by: sashiko (no mail address)
Closes: https://sashiko.dev/#/patchset/09b616df-ea9f-4ea1-86be-ab600119f9ae%40I-love.SAKURA.ne.jp
Assisted-by: Gemini-Pro
Fixes: 46b1e21fe50f ("[media] siano: add support for the media controller at USB driver")
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/media/common/siano/smsdvb-main.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/common/siano/smsdvb-main.c b/drivers/media/common/siano/smsdvb-main.c
index 415c24fbbb65..7fa54de9f775 100644
--- a/drivers/media/common/siano/smsdvb-main.c
+++ b/drivers/media/common/siano/smsdvb-main.c
@@ -639,7 +639,7 @@ static void smsdvb_media_device_unregister(struct smsdvb_client_t *client)
 #ifdef CONFIG_MEDIA_CONTROLLER_DVB
 	struct smscore_device_t *coredev = client->coredev;
 
-	if (!coredev->media_dev)
+	if (!coredev || !coredev->media_dev)
 		return;
 	media_device_unregister(coredev->media_dev);
 	media_device_cleanup(coredev->media_dev);
@@ -1113,6 +1113,7 @@ static int smsdvb_hotplug(struct smscore_device_t *coredev,
 	client = kzalloc_obj(struct smsdvb_client_t);
 	if (!client)
 		return -ENOMEM;
+	client->coredev = coredev;
 
 	/* register dvb adapter */
 	rc = dvb_register_adapter(&client->adapter,
@@ -1182,8 +1183,6 @@ static int smsdvb_hotplug(struct smscore_device_t *coredev,
 		goto client_error;
 	}
 
-	client->coredev = coredev;
-
 	init_completion(&client->tune_done);
 	init_completion(&client->stats_done);
 
-- 
2.55.0
