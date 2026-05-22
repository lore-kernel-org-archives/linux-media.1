Received: from sender-pp-o92.zoho.in (sender-pp-o92.zoho.in [103.117.158.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756259460;
	Fri, 22 May 2026 15:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779464829; cv=pass; b=SiNAgccaONWT8FF7uJlZ2pmKKoL+0MF9xI4Iys2mQOVUamvAc3QsIW25lzYnC1WPKehYXxAc6s3vz537rFV2RScNDATd4wi+0b5NqyGlQ0xKhDqM2dTNLhqdoyq0Lgqw5EP7+7DS7JVL0vyv5qM7mxMrUrEuz/+v+4d5FLQv0v8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779464829; c=relaxed/simple;
	bh=vdpJlqFgMsflCvGvYA8/wYqNVcciDb/odNbR7o5HHxA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=i2hOPJWB+tKSJcWdfv3G++uEjioDp+PKGUF7g3qaW4OUHM0Je+onRJY9TmF2Z9ttDB8e9Pbhc6K2RI0wHHf4jDisTyJ8u8+VS/MSeA45RIU91wLw+CLStoVWK7XOpodghOXF/njK0zdysHTSNpXjPwabgKVBENbfGmi6yn/DiRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=eSCnPdoo; arc=pass smtp.client-ip=103.117.158.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="eSCnPdoo"
ARC-Seal: i=1; a=rsa-sha256; t=1779464815; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=KbARBxV+piBkgtY4bVfvy2fWPSYM2dHSVUnTMcFGDA5dtYN8LnO8U0Lr/D1VmJqfVIf/0trpJ8Ws3lgs77S8FBzNbLhRe+sZG4MwtkF+HOCtwL62lbc4SBRJbsXWjoSC5L0CPBdRY949j6TmEdWPepgh+zYeXDf9IgbQeHWpfq0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1779464815; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Zp1Zb2zqOPl0PmJt8aoEAPWtLpQpQt0Kf45e0l5Dlv0=; 
	b=a5Ecf+g6VMfhT+/6YH3p1t9PsYqjx6zEQQwzaPkWCfy/Jop2jOZUdmdC5ZjNfzvewp/AR8L8yjUKliefQZwp1IYuOsHFJTQa30BSi6GGiOcwKTJ7MtYyfP0aX95Gi4hcf8GCG2sGt7vvZttfdRiMbJVORd61N8hu49ZrnjnQkJ0=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779464815;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Zp1Zb2zqOPl0PmJt8aoEAPWtLpQpQt0Kf45e0l5Dlv0=;
	b=eSCnPdoo4O2wUBdXA7DMuSB3DrmNY/MceqjoSSZClj3PVYEin24XH1uBzFHu9Stl
	fGxgB6GTmuy7f/2Z8fzCrlo8dpaOsVe5va+M1hPGAg+ZhzyVCqV+pDVrDoHR+WxjYUk
	14x9xLjT5Bvaaryj4h0F2Ew1cOSyzoFfBuhxybwc=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1779464812321819.7705393349108; Fri, 22 May 2026 21:16:52 +0530 (IST)
Received: from  [157.35.75.45] by mail.zoho.in
	with HTTP;Fri, 22 May 2026 21:16:52 +0530 (IST)
Date: Fri, 22 May 2026 21:16:52 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "mchehab" <mchehab@kernel.org>
Cc: "linux-media" <linux-media@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <19e505e371a.32d925ff39250.8863979213415950412@zohomail.in>
In-Reply-To: 
Subject: [PATCH] media: cx231xx: fix null pointer deref in
 snd_cx231xx_pcm_close
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Add a null check for the dev pointer after retrieving it from
the substream. Without this, a use-after-free or null pointer
dereference can occur when closing the audio device, causing
a kernel page fault.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2365068
Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
---
 drivers/media/usb/cx231xx/cx231xx-audio.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-audio.c b/drivers/media/usb/cx231xx/cx231xx-audio.c
index 9c71b32552df..a13aef17ff4d 100644
--- a/drivers/media/usb/cx231xx/cx231xx-audio.c
+++ b/drivers/media/usb/cx231xx/cx231xx-audio.c
@@ -441,12 +441,17 @@ static int snd_cx231xx_capture_open(struct snd_pcm_substream *substream)
 static int snd_cx231xx_pcm_close(struct snd_pcm_substream *substream)
 {
 	int ret;
-	struct cx231xx *dev = snd_pcm_substream_chip(substream);
+        struct cx231xx *dev = snd_pcm_substream_chip(substream);

-	dev_dbg(dev->dev, "closing device\n");
+        if (!dev) {
+                pr_err("cx231xx: called with null device\n");
+                return -ENODEV;
+        }

-	/* inform hardware to stop streaming */
-	mutex_lock(&dev->lock);
+        dev_dbg(dev->dev, "closing device\n");
+
+        /* inform hardware to stop streaming */
+        mutex_lock(&dev->lock);
 	ret = cx231xx_capture_start(dev, 0, Audio);

 	/* set alternate setting for audio interface */
-- 
2.43.0

