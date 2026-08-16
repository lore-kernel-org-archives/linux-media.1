Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946F732B13A
	for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 01:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786842214; cv=none; b=Y0rP1H7tt0IV4vk1+OVRPJMqInuzJ6drXwaX3fAh598nBEQzN7HRFPcjVmYRIPHCv8RmAnylX9i6x8t+Lh8vBt9W2k6NRnLHtvk5wbt0ftSZaxZACnZgKe4+p7my8t9mSoAUZB88HbKAKMD1eCbPygLlcK7J4nDylABp4vMfY84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786842214; c=relaxed/simple;
	bh=FifGW5MG7JbFILeAVwa1jNog8QfeQwpsY+9kcqd4X7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kT5bgADzOAoPMXxfDhmbNbn3/8GxpHmrYqqzaHjfYl3PLYlD2UeSYnq88n15bV3XwbxjwT3XD2nToLjzuJ524goDtLwAE3LkgjGu76ocEYDMfMby6GQCapVIYdZ72iLoc89ADWfYrp/yAP36TjMMRVqRUlaZ3Wyd7tlmqlmzmBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9pIVOdf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9pIVOdf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cacf197759so32634435ad.2
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 18:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786842213; x=1787447013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lsCwMPKOG1ojLz18oQtlTHtiNUW+J/Ma5sW3249cgm8=;
        b=F9pIVOdf7Ro7nyG3/zXv6WgRdaJVEClNVvusAiJvCVxj2bZTSNdu6tZKy8YRYCzDSM
         zc6bjwgm2TTq0Fn4rWxc4VlpA/EW4SHezSyaG1lyRNHYmf5R3anmIIDx/j3uF5BptSUI
         EvfCufi9LtqSJuh3EMPh5JQrp0C4MItEt4yXSw75Fsn4+xOEv+QbrTNSUiZBRzJbZT44
         CyG3GIxO7Me34/FYtiGWg1MKA6pGaMoOGrjn2XYU6LHQrW/0C+GgpyjuI0fcJ6HlrgSF
         2v4oOtSnPVXtwX7Jb8ESBsmWbXpgj5GF2ldj11LPtpFOAXr7A+/pIGrurr5uvSEBkdsi
         pKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786842213; x=1787447013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lsCwMPKOG1ojLz18oQtlTHtiNUW+J/Ma5sW3249cgm8=;
        b=HElQIQzgHGba1el9mkPO5fEXtqbNI7u7LQ8Am5h/8YG0ujUFww6omzs6CSKZAiMuck
         T656BDcyZgKcMO2pT9cWFWxFQFcJ1/EuQ2Wv/EcjNfcXwRdlQ3atH5EEPfSwZLHIHZP5
         ArX4uKF9WIH+ooMzaZWVhvfrVwdEme58KMHOOjqMaYG8ZH+YGz6YwoLsZy4qp+Pf2G2L
         DFKfTOj7DOyroVMVL/vzlw8W0VEBVCDOtoZb60ps6MPTrtqFFfNXGuICaNacjrANpOpJ
         bAVtKeKh+Rzgh5OvVr+ppHXOWyxcYjSL2czpz2+RqvLGZ1k/mhGW/aaK69NwF6q1dRID
         gCwQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUnxflyxtRk/P73kAFYuOLsaFV6gVyXBLjinW/rgE3NIqwkvp9YIw0lTU3CxsJwV6kigVxrhhZ3bUNiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeSmD7mAmmKsB8/tJFngjbu06lLUHup+wdLoBSnAJfFsntH019
	xUMezLJ25MfqsCvqkNJupqXTgZtz+G7x0JJIX4NF56uP6/Ii+r2PQQEcNwTeaJVn
X-Gm-Gg: AR+sD11+pi8C5t7dhOKNiftsguugeCS0EDoTER3suPv9EPFvFkMAY9sPOx7rZ9tkV+s
	C7LkXGt6Rm5nD47HzqSUJAPsVyeysfSf9rGTOoTcMAcBv/2XEFWC8CKtPuKDwlgwg8rtWcU856j
	CF7p7oOxXCsfwD5AlXdMG/LHm4rFYsxGgonaAV+C4PAbEWZ/gNYhCb1Uj1Qsv355z09GEKMkD2h
	SNdxn/k7eqAt6FLBxTme4FIjco33tLI/Svgc0FCiYUtImz9MAXlCWoxn2jgd4GIb3KfitHQh+p/
	sXPs+xl0LXjJp+iV9wI85CODfFnoUwX6vJZZ+BppxESoxAzqs/C80GqL3IlBi7EjQ9W2gU9Wahx
	ghhj9mS+7eRBq9G581UbjInBWjA2PAIaE03qO6Q7Vvlgm4IxXnfozhYwrxBWn2EDsnOKbCWAkhQ
	iq4CQBxyOw34UsxqLLBHRM+zefDcegcSQAZDheDFaSxH/i9NE2HjKBi+tQGGiANa/bD3JVcukV1
	+TH673B5qeEp3KhDzJn4nYk0BN2Vt95yvOzXUAYscKP
X-Received: by 2002:a05:6a20:b598:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3cc719c7b62mr19336093637.2.1786842212702;
        Sat, 15 Aug 2026 18:03:32 -0700 (PDT)
Received: from ubuntu-vm.. (c-73-189-122-63.hsd1.ca.comcast.net. [73.189.122.63])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387c6f95sm32113463c88.6.2026.08.15.18.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 18:03:32 -0700 (PDT)
From: Rishab Madhugiri <rishab.madhugiri@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Rishab Madhugiri <rishab.madhugiri@gmail.com>
Subject: [PATCH v3] staging: media: atomisp: Use ARRAY_SIZE macro
Date: Sun, 16 Aug 2026 01:01:26 +0000
Message-ID: <20260816010126.159514-1-rishab.madhugiri@gmail.com>
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
to improve readability and maintainability. Move loop counter
increment to the same line as the for loop and declare the loop
counter locally.

Signed-off-by: Rishab Madhugiri <rishab.madhugiri@gmail.com>
---
v3: Declare loop counter variable locally in the for loop and remove
    previous function-scope declaration as suggested by Andy Shevchenko.
v2: Move loop increment to the same line as the for statement as
    suggested by Dan Carpenter.

 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 0ee52637e..eacd7ee5c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2118,7 +2118,6 @@ static void __configure_video_pp_input(struct atomisp_sub_device *asd,
 	static const struct bayer_ds_factor bds_factors[] = {
 		{8, 1}, {6, 1}, {4, 1}, {3, 1}, {2, 1}, {3, 2}
 	};
-	unsigned int i;
 
 	if (width == 0 && height == 0)
 		return;
@@ -2160,8 +2159,7 @@ static void __configure_video_pp_input(struct atomisp_sub_device *asd,
 	bayer_ds_out_res->width = effective_res->width;
 	bayer_ds_out_res->height = effective_res->height;
 
-	for (i = 0; i < sizeof(bds_factors) / sizeof(struct bayer_ds_factor);
-	     i++) {
+	for (unsigned int i = 0; i < ARRAY_SIZE(bds_factors); i++) {
 		if (effective_res->width >= out_width *
 		    bds_factors[i].numerator / bds_factors[i].denominator &&
 		    effective_res->height >= out_height *
-- 
2.43.0

