Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793060546;
	b=VYewMnR+tFSgYby5sgxoOw2/tbuSr2Qg7WqA8Bqa2TKbcFly7bOzlCiyL+4UtD/ib6Iu
	 9yzY55VYfrYGTyBnCMDRINT1M7EUmvVTqANt6sDkTlvR3NP9rZjjZKJ5YrvqBDNiK2pEI
	 8vRxJtpVqORFiILhwrljWqjJdi8VLdO43m5ggVmVzbXikMDucY8QwGzv5g+lYxdKnyBqv
	 M63aVSuspxxa54eGrOy/fYvQq433KjWvkpwy2h834ckMqV+YvqMznRSLQqn77Sst4RZ8v
	 qWopowK6MNJHJ74uMuDxI+b2AdIMSij9j/Zq/gPjGudyc5g+sKxUholyfA6HMgJZvBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
	b=dRhrdqPfd8udKhHoM83lGENPCJuoqGSp8/R4naZFOJs/CwEtcO+DGemeOaIHnzAVToOL
	 bBUw4PbtS7mjAxjPZBiyhfYYPRNO+eP/cWh2nyntNDbcWXOqxvyYIiO2/oSW1Bku5nAE3
	 DFGPVaErsZeatTdQUS4zK9ysDwQVgNeKSUxbHcrwKhL7MGOT5iLARfo29DzuCRcnnL6IW
	 SKUgsv8lf5kbgENY4+80Bvc6zpdivRWBeShcb5KjjErkx6LWN2Lg0V2toGxvXh41rV8H4
	 NF2enqK/9+XX3+yEPJ1XpJjDDDwro6pAlkaXizMa9HJYW+bhCLaUv+qkDzFgYwowmog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RqVRwstE;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437B5606A31B
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 00:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 437B5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RqVRwstE
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1438d9363fbso440510c88.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 17:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793060544; x=1793665344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
        b=RqVRwstEk0IAtB01732EcshaanpMY5DypEHX5WxS7yKbFTV8unwaPj7JU2c6j+Kz9S
         sxMWWcScesjf6lZxo4chZlxpVFqI/t+OpJ4Dsx8s4ar4RN/9Fq5owjyN5hnWrZZ+Ht9w
         dIQdya0CG3PvNK965IBtrFGG433MIrZh6+W57OYG59ZiQMxSE/Flzj7uM0wP7mRBg9gA
         EKLLqiTeEzAIW7BxeL1nPIfEEAfMlFLyRXDT6CsYt4FsBOV7BW3IbeV2vCvMNdhh9mmO
         dwA2I9YAUo6r6XkpMHbg3lpJdKP3U1ab+Yw6useqOybgE4aUUFcIMXuCuXboTAQBhFvs
         XB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793060544; x=1793665344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
        b=iXQBVbA36yMxIuWIarRnmDc5AIxdLWrORpfbeC5NH82lfSL1qt/klYPqiWy+I6BZqo
         Fn3SBlpn5sfJNQYC16Fav2Dpqe89OX3slCUj8BMIPpfc0AVwLoAzowwdO1aHOCykOpXS
         sDErLwyK7ZJP8GxbkYVRB8tCDHYXIYtKrh8rGUWgbHcHClcny1S5BhmJt6qGOR63uL8I
         d3293WbNyvoBi2jbsqfvWsxWJ9GWGEqpS9IrP6nqcTndyz+MfFVpkfBByaTS2GhGhE1+
         KYg44o4t9KaPkx13nazGaarcdn6VhfXA8yaQ5e/I5Uv7IjZk2VmDrX8CxjLFIgTi8yeL
         3fnA==
X-Gm-Message-State: AFq9FYLvyrtNP2b840LMJ8ijvgsij3GL5r4JxFh+1WKySK59suiNQSlX
	sivKIvHK4+LoxWxeUBotTT1jh6nYJsV8Qg4C/A6QeZqbrkPUg+ZUIJam
X-Gm-Gg: AYBFou11SI5XP1l6IM2yPDT2p4+1WrL2XtJQLjSYamUsxdzThAqtR5p9mXHqk+Lz/FW
	b4DjrkxD2xaVpfBWsZpJNwjTj9A5CxgjL1zH6g4SjwzIYGoSx+MYBmZo+m8n4kW5Wf4YrLI+4Pi
	aMhZ/Co7eiF17g1r1O9yglDT3ROWaYcBAmEWV0qprOB9MtaLhyYF0DY9WLNul6VWIDep6rDAuL+
	bJbiifhi0Nm1amc5VvaYuO8J8TKjLZ5vmq1z1GbcGLl70CqkWv1UCLasD2vm+ImwGPuumFYaxTc
	LdChpxIJjoNPKmk2QhUbI/1soeiTp7g0/sl3Gb0uk+a6nvy/6lCnszlMl6rGgLHS4r9Fgr3dq7O
	HwRrpqKjTi2O7HKR7gLy5C8hruFUW2erGSK9cstdlHvha9J2uBYiC/+UyzDNrg7FEAIHzLpunFQ
	g0d+znw5TmGQjTnKH2P4H90JyG9b7tQThgmI67fjeuVhCS6LsOtXWAH9YNI9LG+wE0kMBQiG/p+
	rer1oOFqQHrdB/EbQ6QCZL5SAswY0Rp3ifwvpYn/etje0jUh+AqNO/gA4ppXe9gZerEtuKvWb7i
	wmQaPWBnEpQ+32u43z+APoZrt0me
X-Received: by 2002:a05:701b:240e:b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-1a3bde8faaamr1245749c88.0.1793060544072;
        Mon, 26 Oct 2026 17:22:24 -0700 (PDT)
Received: from localhost ([103.204.210.88])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a21bc6cbsm27529598c88.16.2026.10.26.17.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 17:22:23 -0700 (PDT)
From: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
To: error27@gmail.com,
	dan.carpenter@oracle.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Subject: [PATCH] media: atomisp: Fix memory leak in atomisp_alloc_dis_coef_buf
Date: Tue, 27 Oct 2026 00:19:40 +0000
Message-ID: <20261027001940.20565-1-sifat.yt.2.0c@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Free the allocated dvs2_coeff memory if ia_css_dvs2_statistics_allocate

fails to prevent a memory leak in the error path.

Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index eacd7ee5c050..48196a358ad9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1373,8 +1373,12 @@ int atomisp_alloc_dis_coef_buf(struct atomisp_sub_device *asd)
 	/* DIS projections. */
 	asd->params.dis_proj_data_valid = false;
 	asd->params.dvs_stat = ia_css_dvs2_statistics_allocate(dvs_grid);
-	if (!asd->params.dvs_stat)
+	if (!asd->params.dvs_stat) {
+		ia_css_dvs2_coefficients_free(asd->params.css_param.dvs2_coeff);
+		asd->params.css_param.dvs2_coeff = NULL;
 		return -ENOMEM;
+	}
+
 
 	asd->params.dvs_hor_proj_bytes =
 	    dvs_grid->aligned_height * dvs_grid->aligned_width *
-- 
2.53.0

