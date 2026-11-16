Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801124;
	b=IUL9L96+3YRq4Qs4ymJg0j91X5nUoDbQd3bPOnCNTSh4xCF0Madgk+eWkl5h8gxecmwy
	 moBeRNZMhuV80KtyUFLv7pwknbMgLbqKPgnckVt7iMI3gYJGQf4477unfSoDVAAxib8/5
	 +H2cgFl0V8cHo5klhSaNS1+R/Y1zKpJ+znRPQQVKciT1AcqRtjvFpD1x3NURa9YQwRzB9
	 5jPc2DePscxJ3C8xL6PtevCJ3cTGaYBbBNdO/RvHP13xsPOxGfdc8gbEkUAFbbJc3xnZA
	 6sDM2lBcbeP8lpjXs4nQ6S1qsCW+HyRLc75HFNRcrh92LBFCoFSPBBsAz+knENRBk9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+QBSw5JnyJShenoN9aDMwG/bIDS9Kt5c5A1/4QeDMdE=;
	b=oKULXUVSqOx/kolX+JY/YFDGCfrqOB/pKQZ1K75m/izyviN1scjzsFx0XfaCga8xaTG5
	 rrqrvPVf7PbUGbss4lc6+CtXuAujOCrywXNWKdwUrZfElnPdSvVSA2wYbCbweJxMf1Mdr
	 8JVNahoHJN7W1il6j+S7E4gIVOIXUozFO/hGY/iXwl/A7/1wGhKtuFPdSGde549l+3svj
	 rOtiwTACwjraqxlaXBu8ZsYATo1ySQ4w9dPcHCwbR82pHAWyBzTQ94jfcff9UeZbk3Yh3
	 fKkmyP1XYyEJEAfoBUKTAIsllc4Y14kJLhNjNe/GB9qfpG7apSi6ZH39hCbIygcSZVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kk5A3Esl;
	arc=none smtp.remote-ip=74.125.224.132
Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD00606A338
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 03:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFD00606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kk5A3Esl
Received: by mail-yx2-f4.google.com with SMTP id 956f58d0204a3-679a0b1c35eso1315624d50.0
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 19:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794801123; x=1795405923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+QBSw5JnyJShenoN9aDMwG/bIDS9Kt5c5A1/4QeDMdE=;
        b=Kk5A3EslIZIsan5XDl5LrGYxTb+D0+qGctUFhB47CTj+Zq033gaoHbtlo/Pj/j/VwU
         YOPPw6RirpzIsC3V0ievIURAb4C96VmzUn7HCE5acJHMXcbH+Tt9dxDoz5CIvNxhp46n
         qzrDSWzXGif0x60u5kKq2Xc69jznxh3W9hpp+2SCly+TETiLUyUqaSyaLCOwM1U7rbWm
         0QkjcLvraYu6zo4SLzXrTIW5uo1o939yEvgfLd0hx24EcRVujMBwcMhwXUdNdNZpLK8i
         PUOGAqebit5skzQVINph9poUVY3YRDlWW9DbpTszyEcSvu1FaTBSG3gg3OU1weqibgJt
         8nKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794801123; x=1795405923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QBSw5JnyJShenoN9aDMwG/bIDS9Kt5c5A1/4QeDMdE=;
        b=jcxcpMlinU8Wx+5ud4ebCoQaPNrN+8WariMxwyg1AP100HTd3zCNvKHyJGOSJs662X
         Md5aB4nub7Rz8wOC4VNQqNMwh5XqPVnHIZmTmbre08Ck8wwM4JXMaTzaAincqojnDG6z
         K9CsCt6SzAdVx2IwDDjyD++psW93En082VYEWW7oDMvc3uQMfKgt9r54l+7eG6x8yzST
         uo+mkVH5fDtYVGIN3Dw9Vy7wgsc35cZTwy1TiwrXjTUFnSbjMWpJlIhYNLPK4xhoh1lC
         HUVJ1xaEpk8gjZEFJ8cGJrZ6TWM1hMF85yv/H1mEEODnW3lNou/Az0k0zimOyYxI1jzi
         oE+Q==
X-Gm-Message-State: APuU4Z+xZ4jCU907n6aIp0APujxGU3H8ggpJzW+BxqFOd9uPA+SqZmhl
	qTdWK3jT5jx91ytt3wd4lLuG4AJx/2i7g5LUKfEVZ3NuHo/9gclEU8qsF6t79Zoj
X-Gm-Gg: AZFdTZd8Nq9VmFS8wzzd8K5oDPfY2WREoPGvyXPrPQbwH74wZtuQryAZw1/P4+AOgr6
	BeQu3shKhwAWPeG538W5R/0o5tfg0hivBEkYzwqbQ1udhEFHRE8VLVulI/LWcqppjK3R80FskBu
	O9gR/AsWvfOV1Ork6AoHgXcQDDZpuCyZ3ZHtpgeuXRORvmcpGpMgbKQj1/y5FuYpD7yIhtCrlkG
	HzrtKNgssVMOeOWGtKu7JzRpGm0MFCZb8xuk1MKSgyDb6Cd+VG7tpKz++TidYAFrahuvN6OwUGN
	pfXpa+XDfKAmH8p917oqY7GJsYb/uxOOOQKinZsQqytaTNpwZBoEN439EJ/INUJVze89Okz/Vky
	/6yxRigWO1xnniajcqdJOlSNudh15TbL5PZbjWZjVlYJYvRxT5paQau/joevbDPu5lgE7ZvSf/q
	14vtmvEFiMb77VwqcMGFpxk5UDf57RzD9hFI+XMrQefJvYmPjAjtY8JNhTEi+73p92w9zoZmGUW
	S2RyrF/nUNX4b94oYsMGyGYrFUqoZs+OaHabuz9LvipRvo34M3LW9sEWpdCQW6ggosxsKKtWvpP
	Lc3J6AprZWMTR9xjKcU2UnYn1nTiMVgharZi8Y6goboA66IUzvNrKFKElsdaMT+CQgESXQ7RiGr
	vyw5YyVA=
X-Received: by 2002:a05:690c:6602:b0:8b3:b358:f9fb with SMTP id 00721157ae682-8b4aa26fd0fmr50589857b3.25.1794801122737;
        Sun, 15 Nov 2026 19:52:02 -0800 (PST)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:28d5:8044:61b9:9cf6])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9549fasm77253657b3.21.2026.11.15.19.52.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 19:52:02 -0800 (PST)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org
Subject: [PATCH media] media: cx231xx: cancel module loading work on probe failure
Date: Sun, 15 Nov 2026 22:51:59 -0500
Message-ID: <20261116035159.40755-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cx231xx_usb_probe() schedules asynchronous module loading before
creating and registering the media controller graph. If either
operation fails, the probe error path releases device resources
without canceling the pending work.

The work callback accesses the device structure to determine which
modules to load. Since the device structure is devm-allocated,
a failed probe may free it while the work is still pending or
running, potentially leading to a use-after-free.

Cancel the module loading work synchronously before releasing
device resources on probe failure. This ensures that the work
cannot access the device structure after it has been freed.

Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
 drivers/media/usb/cx231xx/cx231xx-cards.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index b0941cd2a2d8..f8ed894ac0ed 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1533,12 +1533,18 @@ static void request_modules(struct cx231xx *dev)
 	schedule_work(&dev->request_module_wk);
 }
 
+static void cancel_request_modules(struct cx231xx *dev)
+{
+	cancel_work_sync(&dev->request_module_wk);
+}
+
 static void flush_request_modules(struct cx231xx *dev)
 {
 	flush_work(&dev->request_module_wk);
 }
 #else
 #define request_modules(dev)
+#define cancel_request_modules(dev)
 #define flush_request_modules(dev)
 #endif /* CONFIG_MODULES */
 
@@ -1900,8 +1906,12 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
 	if (!retval)
 		retval = media_device_register(dev->media_dev);
 #endif
-	if (retval < 0)
+	if (retval < 0) {
+		cancel_request_modules(dev);
+		cx231xx_close_extension(dev);
 		cx231xx_release_resources(dev);
+		usb_set_intfdata(interface, NULL);
+	}
 	return retval;
 
 err_video_alt:

base-commit: 48fe5a7834cc10081887d7bcd9ff0a4cadc3fa8c
-- 
2.54.0 (Apple Git-157)

