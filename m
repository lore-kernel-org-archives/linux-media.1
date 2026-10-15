Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC57C545296
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 15:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079884; cv=none; b=Q9Yr/e4Qlw0GpjTy1al9QWkwsw6oda/GZQf7tJBR9aczMexQLGBoJtkWLPfwVVZtrpdjACNpPDKB5o3Li3pYdAg/0qnMVUHljHfyGE2IaUhpNt9JpSFxCOA9puxYgzr881CFG51CobDUGL6Xt6f0EvsgeAsSybvfKUvoYCkRWXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079884; c=relaxed/simple;
	bh=AbDp74FboY/m54pfNSPGHJTdkLesKVKCn+j165dfG4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sq/v5uEJ0UMF4ELkeQkCYKG8904wQE7PNTjL9EqwJOZpBLp2co2cSo35CFH+VGh3+JPtzMGcYMmOCjuU2CFTzNGe/JLgmg1K6ehMBNWfiHeeLOZAi2IvIrDqZe7bA4CmzGXOxSz1gqqmYTWx201/MIFPFYi9ybWX/jFc3MtyVCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=KUcJexIu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KUcJexIu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so46535855e9.2
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 08:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079859; x=1792684659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFRbQJjUmlnKmha/sV3VtEHUk/rjFLEESBDTOweph9M=;
        b=KUcJexIuP0X1spU5BTCIdLySxpGmyypeRaamvko0s2lMuCQod7lr8A3VFZ9pdUOdLu
         TY6hrEYMEMbOEoCQRMT+2AVVaZqxMQj3dgAIPGj0LKPGJQZtW+nhW0N/PhKAddvNN0p0
         VzMjOf0gXS/WHhpkoDzi/YOQ/TbIMrXCjdE1JnbUwNt556Qjj6XTRCv1uvTRXaOFvfgr
         EbXytLLtLMz3ZXN1SSDBZaQIfoDpFRKZtSmDgfkjloQbupKTyETbML3lMMo8Q7ONW/qx
         7MqWzbH8+xkk3Myvk+fVgh5ZqCXMKLDLaeUJD4Gc1jeKkAAMSnU+rEZsuo4LDay6tsk4
         W/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079859; x=1792684659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qFRbQJjUmlnKmha/sV3VtEHUk/rjFLEESBDTOweph9M=;
        b=t2BZyGj7o/lnPUVEOth6QCb6ixczQp2Nry4fEwicq++2SSLfcppcWlrAwH7GM2cMrx
         aE14DjwzNnEEdYJe52lV/gVCbKEUHgeZ2FsIkVv5oOwuIySpXmmWsFkVrhNmqn+LhxPq
         T/YT0GI5qtFrYHDwsTwrmv7EAY1ssWGLg/aOUwNdVMHQlEA7IxoLXmELdi4ZceT9BWio
         rje/QsA6AZGiVJf5gaau9wXxQAAaxGMhjhQHST93qAOVrwwWU5Z+9ZJ2w30eFoKRw94H
         jhxh3F2D0iC8qVxoZuLDIXNMj+HKdKETMI7f7bjA3mHNIIvxnQ1V4HnioSA3Inkidzb9
         G0RQ==
X-Forwarded-Encrypted: i=1; AKwUvBy65cGxE37qOwCfW+50YGjsgJDYsCdd2813Slph/f0U4mevDmBDvaPUfrERvl3FypvK1Uf6BJkIJqnpbg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJhpAvAPmiLeKdqCSzJOrtOINITr0sXLGMgr9TsPDzqBPFnNUJq
	zAIKmyu0Iigi9pXaCm4kuM09quvl+jJLz7dX8JEkpz6aVgU/+BcimOZMvxg7A+TU+xo=
X-Gm-Gg: AYBFou2qyk3yZ9pMvOxcMzTpWoPln3j4JBUvxU9m6g9clZmSJbrVnhctOZiU3fg441R
	y1jrzdsooiXCJ+HAQgKTuje+7vBJ61Z7YuPgtfGsSTApXw/e0VGBpBH0bAR4rxx7WR9LEleWT5s
	yiKQTyB/IKNLLiFB6aKNe1zOcTdznOSr4PW2DWfIebBmzl1xtDJtLM9sG/26ow5pUDgwCtIG4sw
	dAteP0TsL3aQKjBUUe/IWYNZGlpEdgc3gV+Ern90Y++rY72OOfhVlWCVYD3dKSCiOIGYgY6YVYJ
	FeiDBV4OIe8eYATPE+q5DsN8iF8Te54O7NVIzTeioISib8EJEy1TBsQyM6gcez1I7LQRg4q0RNH
	cScZxn90a09DoRnEJOhfFMxZJbNT8b9hF7Tvzacfpsf4rVbhc06Dl+xm0fQs44bGaY3Ccc2kh+D
	LLCSi9SXYHXxfLdHhzC8bStsszvTpnNJJgwK3nieexObQ/cPEGS39Pwt1RvXRS6vC1q2vm1WZ7H
	xmk8pKMQZD39bKpGqMR/GDvqWL+BdIM4xH38qlQQAvCYGdrAw==
X-Received: by 2002:a05:600c:1c21:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-4a18e4b6241mr469180905e9.16.1792079859303;
        Thu, 15 Oct 2026 08:57:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:38 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:29 +0100
Subject: [PATCH v4 03/16] media: sony-starvis2: Always program the sensor
 in window mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-3-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

If the requested region matched the defined active area then
the driver switched to all-pixel mode. This left the possibility
that the active area was incorrect and not reading out the area
expected.

Switch to always requesting window mode to avoid this potential
mismatch.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 3656658e18a4..c4f590c489d9 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -921,9 +921,7 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE,
-		  v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x04,
-		  &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - imx678_active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

