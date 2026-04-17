Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434A83B38A9;
	Fri, 17 Apr 2026 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776436244; cv=none; b=ou5gDVZ6nHM/iO33lp0QcWLKC2KHo750sO7e6JbfuOrr0cZyLtVUSAyN9FmGP6evm7yzIdTvsPsr855sFN2nU0Wk2Poif/Il7WOCvjneicTJDyXkqMJbXqjaGpWofMPyQPuofKFXf3nYe4cR1KizKhTXI2ZsYlxaXna4VxFSNg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776436244; c=relaxed/simple;
	bh=oZ/rIQj4aDVkGbtwQ41oaok3D7BaTof/1+7B5AmWQQ8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=dtOAIgx6Vl3xJoVJqlXV1BBs4GDRMPK1Kt+joMJ4WQPgo3MtpvCr/T3vT/J49rNilq0peNIWxukjz/Kx+n6zukq+q7JZ5Gv8UKuRCT/iqAmQZ4ajTkY1yFvGnyfmDMjxYxPp9z102Cja8e+Yb70fRCVIVWwzwYx9OcKoxbiSOio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 63HEUSoP001826;
	Fri, 17 Apr 2026 23:30:28 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.5] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 63HEUSNA001823
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 17 Apr 2026 23:30:28 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <09072a14-77bf-47cc-9b79-1edc3c1426ea@I-love.SAKURA.ne.jp>
Date: Fri, 17 Apr 2026 23:30:24 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
        Tomoki Sekiyama <tomoki.sekiyama@gmail.com>
Cc: linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] media: usb: siano: don't set URB_FREE_BUFFER flag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav401.rs.sakura.ne.jp

syzbot is reporting invalid free at usb_free_urb(), for

  smscore_register_device() allocates all buffers at once as an array

  smscore_createbuffer() maps each element in the array to cb->p

  usb_fill_bulk_urb() assigns urb->transfer_buffer using cb->p
  which may point to a non-head element in the array

  URB_FREE_BUFFER causes usb_free_urb() to free urb->transfer_buffer
  which may point to a non-head element in the array

The urb->transfer_buffer must point to an address returned by kmalloc()
family if URB_FREE_BUFFER flag is set. But since the urb->transfer_buffer
allocation strategy for this module is to allocate buffers upon device
registration and free buffers upon device unregistration, we should
avoid setting URB_FREE_BUFFER flag. Otherwise, double free or invalid
free will happen.

Reported-by: syzbot+b466336413a1fba398a5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
Fixes: 564246fd3ff4 ("media: siano: Fix coherent memory allocation failure on arm64")
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
I found that the same change was proposed at
https://lore.kernel.org/all/20250522140048.2811356-1-n.zhandarovich@fintech.ru/T/
after I wrote this patch.
If nobody is using this module, we should consider removing this module?

 drivers/media/usb/siano/smsusb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 0fdc2e0950b7..8140dc0c8b7d 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -168,7 +168,6 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
 		smsusb_onresponse,
 		surb
 	);
-	surb->urb->transfer_flags |= URB_FREE_BUFFER;
 
 	return usb_submit_urb(surb->urb, GFP_ATOMIC);
 }
-- 
2.47.3

