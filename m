Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5BB32B106
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 02:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786586717; cv=none; b=eUrIkHDyKGKdaZUkzU/tTufFnMkPLZptaL67QP4Fs3b/he0qsB0nhRwEEi/YwzxWXddl1e4L6gocMWhvRlrFH974PAyjAsx8SZJBbkuulzEMHqAWAvDRD7FBGHUOh3jPCq15Wuvgc4GuJkkjIYrBz6o1O7piR/3lO6hivkZFsNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786586717; c=relaxed/simple;
	bh=P6XmHm2jopIDLZ9wxmblpOwGhl1pJ8yFIf0eHnPLem8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E3TaEhYQ8arxVoSzZszYtlHvdo651qVVDOlI2HHfIFh84YrncGT2RjF+lulIXjR0Ons1VYYcVdIzZaK6XHqArvLHD/QNMzxcp6raBXNe4PlNwTG4CoFk54Tg38GyyjB0YLI1JQyVCGa9Iqs7tI19YtF2WjEfCBfHL8Ng+26yZo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rC6a2vlk; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rC6a2vlk"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso1346746b3a.1
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 19:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786586715; x=1787191515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjzN8/VwxxZireiAC7MXwxj44kEI7Qao20/qhkEuwV8=;
        b=rC6a2vlk021QknnK/aSPkE+euRBoxExMiTro0e7KD9TKzjl/kPpsXxIdvZCe4BsHkv
         ku1re43qAjoL/DlK5S/EQKxeKHlLCDeg0y1baI9dUGhccECh7mNn9BnsrhKRUd73gdbX
         RSk/laUPWFpo/G4mszHeTYJbiNIXiVHAlzb11ct2bJWiB/+1u7qLzJaFW3NmIXHIMbrL
         UIqazVlaqS4lwbjm6WQBqJDSwlbL3X7JbScvxU2CBgMlCwFQp3A/x8r7XBndAEPTzNyg
         KhfQjLNgbOZq2YPbSuHjxGbYDic94SmDus8Ky4FlmI6je3ZUaAhdrOToUeiseef+bccy
         nOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786586715; x=1787191515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjzN8/VwxxZireiAC7MXwxj44kEI7Qao20/qhkEuwV8=;
        b=ED/7teHVm7UO91Ggwscr/WPWf91LOnRdJYSVoGisEEVjhMyU9djY4cRImSfoDfHndX
         kKniykyeXNABYQ+hJFiBp/8tX9q0CgIvTaG+zzMVJOI7cCE/3Ow/xCQamnPyAdITfrZX
         KgY1kOVfmZhFKmtvNqrqZgGyF+6J+XoUOwhsTBVcRRz6hOTm/wA87SgxsRUsDMz6rHCL
         RQdH+VCtPRQCRG7WsWRLdpr00/EVD2eBQsshfFd7+XDwOv38erHUuBJQdQ8mcWdvNBgs
         ACKy5Fz9rB7ZlyLn799BIvrQUjF2zPAUn6nz+6GsVhu1ivDiM3XAsHp8ovx3trNStKzF
         yPcA==
X-Forwarded-Encrypted: i=1; AHgh+RqLiPxF5YwNGxmcNHsp7EcmzoQQuV6VgRO3TTIdzffAZX7yEM2I9Hp79+RgA0FD0fdDc1l9XFNgLvW11w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi4fv+fF+kk/T2sQM/1jO/XoEqNw0DzogrJc6hhF8Pxbr/bTsC
	DI3TNN3gzjLbNoahGrywUU9PE6ihmquI/oOLFWMY2WzJqlVDNU9a8Ipb
X-Gm-Gg: AR+sD10iIdxn7lhcBSAdu6LiBQaNKzst2M/m/sETUg2UfjCJkWOKaMj4xN4nck+m0vg
	BsyZlOEXJmIy/+KFUrnf1cJHEbTTaV6F/fIoEXqj0RShB/e6kjLSSfMW0T36szukLb4iTwkgmpD
	RE+g+VLIcmtz1GkQ7s8PTlc2DPkVJd5bNrVm1nrg8AHSqnWfbz86Wgq5i6GXNO//g+2EB501Y5o
	Q4GDWWqGIjGQf9RYwmBJ1dUZ4n3F2BdeZgcKkAirbFJ8eK/bHJYa3oclfbnLTKw7tgEhsCHBY98
	YbYpHkjDVzm9XfXd7+CxngKQcjsUTQrdsRNzGdmsgtpYp6cknHAWi83XI3wc/JvPHClzk/G+yHs
	jj58apjP4OTwBeMjrd8QelKpd9fuEYqe6HmwksxXfzB2/TlbhGZ6aoBYGoTIOedZvicva3hLVF9
	HEonpMOGck2ctVhbfO8LylJAptJx5QPpDfnHhW/4jZNGL3/TbrpNxdGP6DSGffezsy5/q05Yn6W
	FTUsZLRJTgeI3E27QdtlV0caBN8ztVdJnumkfqI0cSJ
X-Received: by 2002:a05:6a20:c90d:b0:3c3:a20f:f729 with SMTP id adf61e73a8af0-3cc550ccbaamr3685375637.7.1786586715265;
        Wed, 12 Aug 2026 19:05:15 -0700 (PDT)
Received: from ubuntu-vm.. (c-73-189-122-63.hsd1.ca.comcast.net. [73.189.122.63])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d8casm1993497eec.3.2026.08.12.19.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 19:05:14 -0700 (PDT)
From: Rishab Madhugiri <rishab.madhugiri@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishab Madhugiri <rishab.madhugiri@gmail.com>
Subject: [PATCH] staging: media: atomisp: Use ARRAY_SIZE macro
Date: Thu, 13 Aug 2026 02:03:54 +0000
Message-ID: <20260813020354.152120-1-rishab.madhugiri@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up loop bound calculation by replacing sizeof(bds_factors) /
sizeof(struct bayer_ds_factor) with the ARRAY_SIZE() helper macro
to improve readability and maintainability.

Signed-off-by: Rishab Madhugiri <rishab.madhugiri@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 0ee52637e..83519dd8a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2160,7 +2160,7 @@ static void __configure_video_pp_input(struct atomisp_sub_device *asd,
 	bayer_ds_out_res->width = effective_res->width;
 	bayer_ds_out_res->height = effective_res->height;
 
-	for (i = 0; i < sizeof(bds_factors) / sizeof(struct bayer_ds_factor);
+	for (i = 0; i < ARRAY_SIZE(bds_factors);
 	     i++) {
 		if (effective_res->width >= out_width *
 		    bds_factors[i].numerator / bds_factors[i].denominator &&
-- 
2.43.0

