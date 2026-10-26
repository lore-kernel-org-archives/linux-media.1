Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793037605;
	b=KQiNMQXGtnTVarFLPKXjUacC9Q+uHC4Yah4wkzGqRg2eS5Y1NYbbCXk4Hnrfaly0wjQp
	 dxOD+D7Lk9TMA5etMMc0q5sFB0nqCy7g41yA0OCRwZQpcx8IHGRga5UYgJuPEj1c34oPd
	 Jb0kBd0T1g4s4a0M2r6ePb/D4CGG4yd0SRtb57o/t/DFFaCv3hY4JsgNLz0ucyjx/Jo4W
	 I07MMA6wrVQrfArMicko8pEsqOBCoBgx4AYsC4cEAce7k1Bb2mRhrVxOIjQO1cVhI+Oac
	 HqOYx6xlxc3pauX7AkJI+oKJvsrAliHU6rzIt19pSBxZolydakYKVIEHMBCnWW1VsWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793037605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
	b=b+PSigqlDEaQDKvuaTo2xHHhyuqiXmi3qDPD0pzwodUC4gsuHp8d80h+QzbgRBlxjsFB
	 XUA3kJl9YsATDKa2/31mibIY4K12EAdSfaJWUKQSrBh2Fc0M07o4Tu03KFqmiBwc7hQ2z
	 N4psyud8dZasFlo8UL1xbgSlwspLovdZQyMFkNYwvUVHDYUJvE5shr7yhDKPDnshIyx2E
	 q3POwfchXNPwlUfcRAa7n46vPcF895RjrhnYATBIigpTtyweWA9EiyjKpVQ20VbEgRrbr
	 R1XO0lUEWbSAfPiJiYZdfKaff4gKrz5iL52O45hQLTyGpFT3z4QAjZ23jzqCAct5qmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dPPS+dZq;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF183606A321
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 18:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF183606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dPPS+dZq
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1846bc43c28so3501366c88.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 11:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793037604; x=1793642404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
        b=dPPS+dZqwhyPLHZWlZAorfsrTLZwzWKWt3+xwo3MQXeYeKsgJJ/EVgowNxbQsW9FtC
         8osT6J8dQ1zQZqCPweC/R6WQmBfim2AnVTN6y3ZYuOm860crIodUKEFGhPUQNEckvP7k
         RjRg6OQsHAXi4FWt4fnWiP71C27NvlIyK+NEQ9Hml8u79OXEJGiykKwATXY/r/my7Alb
         dc/GhEXXwCAFcSX30mx1ALCFQ1DOZdSEqb6cKTuJ6/4LghOpbkPVwO5KVi4ug44ScMkZ
         tpFtJidALnIZ62K1q2X+d7mBxE+OQTZ35j2ks2Ms9gPkFwDt3YjA9MXEfHGDOaCDmh+u
         f9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793037604; x=1793642404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
        b=ePpLCnS18dVfZ2GKpVeSTXfetTd033Zxx17zAzZYVXygOTIYCyeyezG7CossXxaHac
         Q+aAKufUwvd2zQXrea+MlhNiagho6gT6U2JrJc1Luu6JgtlDCZvQLOTdxW5rGOxjvlpO
         KvgpSj1KQ6WqQpOPR+T3gWT5hwId6xoWIrHCipkHEghWeHoAdw75DQ0AdcEZfOmVy96Y
         OI281kPFOQJ9a5PXma98wDwGZ5KFu/FfYnG+eEuScDn1YFjvJrjrM+TKmz6lyfSpN85f
         7znVuityALmBtl2E9RX6LqKwI6G//aHSXjkP+WMDZJ10LLebV9VyejIxQVREf4WEvhNq
         Mgww==
X-Gm-Message-State: AFq9FYJIC4EZU++rPnLgZXrmvKrC+ryS0g6Dy9q0tolAxa3fhZDN1xgs
	V1fSqBLBGucshAC2Qc/r5Eq1qMg1kw4uJZhObtEyVTBYgGrjAWvfZ6FY
X-Gm-Gg: AYBFou1w3Q9I67d3X5UxQS/EwFLHvcK/F9RDpErrkPdOJy9PzkuFnh0msWvKywJPTD/
	b7yVfZjuzc4ZIB5B+ju6yuBfiSXF+Kc7SG8NXExSMUc35PW5BiE46PTlA2/Ihj7aNbGXUPtkjYU
	WepjlTNib4kRjZzbBOhoJ4L3UI+cUGK+zi7XsTd5nASV6AnYAauUexJsRsGv7L8snJsOXaeynXl
	Mk53j2e8qtYl1IQahb48h9mQtqL5efuYIJ9heHuGww4IaC1xpcwNbgLRSopdPW9lNpEz5K/IaT3
	Vo9O21xn/T/RLfrUlptfmbtA96IoKS0knaNIiVqT67jgG66aawu6uLPhVdO+nU1S4b6/1pfHHyB
	Xar8dcnB1gZTeLHaQ+3QTjlEVT4rGOw9yXk36R4FbIYSfAxLI0dpo1k9t0Bz0JZuyTwXb/ApMkU
	ydcYmED3EBBCMEyh3vx+h8QvKsbaVpyBcqP6ZZu3W4guO8KWUoNLWfaepyoglPy/fTDZ0XL7fGm
	tOLT6sRSmwyxmTkgKYkMhmufJqomfNOGWyGGECfj3zMbcIZUG880OI=
X-Received: by 2002:a05:701b:4582:10b0:14a:a6dc:9ca6 with SMTP id a92af1059eb24-199292eec43mr10712176c88.3.1793037603609;
        Mon, 26 Oct 2026 11:00:03 -0700 (PDT)
Received: from localhost ([103.204.210.88])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm25310060c88.3.2026.10.26.10.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:00:03 -0700 (PDT)
From: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
To: dan.carpenter@linaro.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Subject: [PATCH] media: atomisp: Fix memory leak in atomisp_alloc_dis_coef_buf
Date: Mon, 26 Oct 2026 17:58:39 +0000
Message-ID: <20261026175840.13979-1-sifat.yt.2.0c@gmail.com>
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

