Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8AC3CB568
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 01:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437467; cv=none; b=tO6KFIyIZvHLxlBuOC38072atj649ThrmvGr+FbON5Z5pmBXk3I/D+n9ymvq10kMN6FC63maRs8AB3IR8Ww5kQdx5QJyyDwxWgxnC/ngoj8ktcSFpbB+/u3ZE63+e0iZ9AgLknJ84iyNdrebXSNLZwRBOoG7JlradGiS0ABP+BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437467; c=relaxed/simple;
	bh=cDTEaYFdU4bsYd6oOIV2rW4rMgwTR2VRJE7sbO0BfZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bd7MCOmXrjTCWhv99AY+czqlFXoZqrcsw5aUJyvb86Ff3obNR4JcZ0zICfIL4Q4U5uV9AbHPkAYdOL3YQjnV7FGRgFCZAnwv+3QSFudP8V9EUUMhITovpZ89N0QItwQshgt6Al4mezkGOqusFbUb/gMw7gLdpYoHiiBPoNgfW60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmsFinN7; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmsFinN7"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93a0bf264a4so242053185a.1
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 18:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437465; x=1790042265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mjFWFVeGJngDPSHgQVYhBNSO+sPnzoNj0Nr7+08rl1w=;
        b=SmsFinN7lgYaHa2rL7Qmu0UMA5POGGHZ1HA3rRZ+3VetM5yKbPhy1LtzJCKzfyS0eL
         xj7bf6u9UO5DBhELbE/RVrmMdmcko0y7kRRp4hRq58E/FNyHIZzTj1pkvVqrXK8xhXXo
         gDBCA7UqftBFZo1sV5vngHAqfabTh7kvj6VsYfRJDgU1oUd6Dkq5dnyyKuiNAqXj9jWK
         3BwNZwt75HWhrT03asfo4AqWwHdnrhU0fCK6OEFg37zCGw+xkgDtLToz3uE21r2zlU9/
         6FhS84Kc8qMpdoBf1GU5KIMfgM0HCC/Fnr09whH71ASgx+nhqWFmILQ+O9gQ3LO9xCPX
         cU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437465; x=1790042265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjFWFVeGJngDPSHgQVYhBNSO+sPnzoNj0Nr7+08rl1w=;
        b=sQ/a35LX847+uYPLf2HYo2V6QOQfT6F4nSm5PMjHVICYGcDSlhVWXyaEqQDhrfR6sP
         oaCKx1vi6CS8UCHGUtLLY2WrM7QH9YGcaJN+e/ECzDfsy3u397PpmUYqLPvn0wHUHe8Z
         5U6arONqj4Dwm7FidBMoWN+Bv6b+cUrfed4cYT8v9ZVM5I7cxOE/QOK3YtPHT/B1E3BP
         12en7EQh2bJ+krgbjAHXP5JR3kAwRN81fTBVrzESc2ud87FPTi1SKkzRr8DjxKQsdTsH
         sirSS6OHGGPFWqS8QhRJnUhdmn4mPEVunQ7KKOr4o8O6Tn5Y4PHrogAtXQ49jgsdkfYu
         yW9g==
X-Gm-Message-State: AFuF++mmXbmdG32CSRAwCSWMtFcgRWlUj77kUzSYKiIuzgQlPJNJTFfu
	EW57kvfD5slg3CFg9CzXLqdaBzalzAkcuxa/PQy9DNwbjgwHs54ELSKDYhD1Tvrcrw==
X-Gm-Gg: AYBFou2mgeg8m49tjFlfrQXebJ5p0Br4tk/PnEFR9/fPlGBLsT4S+Nm/EQ21TCUswXG
	FAqLNjysElX6+Fov3yfJ5UKXdfqzu11RMiegEqNoO4skOoVfLwtCP/XHkvVZkekCkYqbuoU+7Li
	MGzwX+R9c9JTdw/LDhqyyz4ufEBLiuhhQb83YOa0vbeTlBiD2GVuFp4GWOp9m9limfJn6gtHzFa
	UmP7MowaMnNfFg6JOTfRXkfpcdBl4/1hkN3wAb1VtCenM7zznYEo5vujl+UjQuXCZ8dzz/uhTYd
	KQ63FtQI+Tq2S1voPwyClOIrBqsoSpog9ADH7J7TFKMextNee6ezPRLMD5BYqwhQR5t98R7HVB0
	k1w3WKSgcmiB4ip0WTWmWyCPmg6vkmSRborGazDFG9tXJq2a38r1ksZC750iHwcIJkHv5pVTZ9E
	Uymy1L4Fit4BPelyKhRE0QRKdsCBjlRpYKW4wi7Txav05euM0dP7FCtkbNLeVyy7Vrf+b8x+vbV
	pkHklRsE1qr3jE4MWIqat7AGo1hY3igRBt04j6G7kVO+uKDuH9reoCtG133LfoA/KuqQtAzUJ/U
	T2xAb1GwvK7zhA9dzJaAvq41q9LVK6vh5KvMFAZReRNizVaYMZcVZEU6apo+dAmliNmo3Q==
X-Received: by 2002:a05:620a:260d:b0:939:1483:55c with SMTP id af79cd13be357-93a2977f5admr780633485a.19.1789437465389;
        Mon, 14 Sep 2026 18:57:45 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a00da28absm863266285a.27.2026.09.14.18.57.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:57:44 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: radio-sf16fmr2: unregister v4l2 device on tuner init failure
Date: Mon, 14 Sep 2026 21:57:36 -0400
Message-ID: <20260915015736.85420-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When snd_tea575x_init() fails, fmr2_probe() releases the I/O region
but leaves its v4l2_device registered. Unregister it before returning
to the caller, which frees the containing fmr2 allocation.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: d4ecc83b79cc ("[media] tea575x-tuner: update to latest V4L2 framework requirements")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
diff --git a/drivers/media/radio/radio-sf16fmr2.c b/drivers/media/radio/radio-sf16fmr2.c
--- a/drivers/media/radio/radio-sf16fmr2.c
+++ b/drivers/media/radio/radio-sf16fmr2.c
@@ -241,6 +241,7 @@
 
 	if (snd_tea575x_init(&fmr2->tea, THIS_MODULE)) {
 		printk(KERN_ERR "radio-sf16fmr2: Unable to detect TEA575x tuner\n");
+		v4l2_device_unregister(&fmr2->v4l2_dev);
 		release_region(fmr2->io, 2);
 		return -ENODEV;
 	}
