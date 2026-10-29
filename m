Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267732;
	b=vgGd+FXIvlnzkOdU0pjCp890CLjaCFaJ7VmzI1YFEt0yW9rjEeLpFWrzfKWFV6U1vJaE
	 xcSpE35/r+PQBCN9oIBcqTXpmw5d5oGXKPsUrt+NUVqWW3mqJvOQXziZ8TYFN9goEChJp
	 se8SexW1F9i5sb3Wt92Mfjf6H1EDYnU3YZwCyaFSr8QqMSwW1oVShOuCgbo5J3W+kaRqh
	 AVLS5YZgRs9yK5jksz01kQD8+hHW2A1nKYjhOje2wXBOPNiFKdox0fyqg/8ii0pD6yfrp
	 bECpSVrJq8wr2yE1rdFqpsthyWDpDhPPoMqMHw40oVM3BHnzNu6qCnLq+LbcAplzw0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=imi54UIQcMMOIPadZc5pCH/db0dGleBbmHd3Iwjq/sA=;
	b=EU0jUSYBBjgSX34TKSRwOJ9IJhGdjTYbEFnA9HzRkkQ8j8gNHKwyTXwld4IKzVpzRBZi
	 YrrK8pwzl9fmPqNzWaGrktODMoHD0iOFv/HzzNlijMlkugrP2fs8E5cKnQFNn9WCdmhmN
	 663S9DMhUdMH2iSI5jPazk5X/EzRhL2BJjxh+GPaHsv7dYxm+rMmRHbMbDZaro9fJinEo
	 s9B9fgAb2r14qYRZPcf3+N03V6U1h6AjGQrx8yTJB8nLCHc/IKOi4W+6OYjZ9S9oEdl5H
	 Izo9hK+pHCumjB06qONfFChZ2P62opOnnSp8TAGIhL3g0sPIW2eMOXAArT/XDNCXr3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zzW5RKE3;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B33606A339
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3B33606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zzW5RKE3
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1007557f8f.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 02:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267730; x=1793872530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=imi54UIQcMMOIPadZc5pCH/db0dGleBbmHd3Iwjq/sA=;
        b=zzW5RKE3ZLvXYwPWIxESaEhHqv3lRvSXT/Ozac+ewVT+iw1UkLGJCCzFUc/+W6atXM
         QnyTZ4tEZ6JhaqpFdW1HFQtlTEAvCl0iHZYJOChSHn0GeTPiAscCEKrFTEyiO3WTRgGr
         PQtGL2buYJOlfGTryhuNKpnjfLABWnpDRA4YKDqOOBuRj1DoPSs+21zS414eYs6AH2mY
         QmYSdiD7hudc+MENsHj2ODzivu5sIDNDeZuo7JF1+IplnOXAWytHKboHTGiLgyo1IhCm
         6FuI6bPuEemnEkTZmsQwsGuYCZUdQ42VNKYW5TStT3OeovzUJiCTGr0zvoUxzmh0UsEb
         Huww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267730; x=1793872530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imi54UIQcMMOIPadZc5pCH/db0dGleBbmHd3Iwjq/sA=;
        b=xVPDsm0HeA4+goFvnQTxwBcCbGkPFk35uQzKjbsTk4xr9KEO/DtqsbrjDm9MSsokBo
         ycp3d3nA0RYDkuPZkiifRM//gTW075PRaf6KZ7jWxmNpymktFx/kdLGa+8uM5oWJLNLF
         d9twE1BE8eP15J6L27053A6HRm6w0iq/eia4LP4xSyWBbcTnTyyka7bA6UyFONhEyS6r
         zSL/Dg8/DXO5gNzF/sqwRMCJ7xW7M8XxdEVRAUuo6IeXfB1H83kE+D0a+I8qpHz3vILV
         TmLoauuEsrGjK2uh5Jn3/+QE4fyi51x+Qh/mXcDUAJDraf9Bv3scbxweO/LKndYcWen3
         Vtbw==
X-Gm-Message-State: AFq9FYI8xoncY1bjGdp1vLP1yWRxvUySt0mrL8dcHTjEkGJgsHVtt2oC
	CRhaLka27Wz1MDU7jJkTUJToov6JGAMjZqShqxdhivP/rlfp3d1XioOLyZvh6hLqdpg=
X-Gm-Gg: AYBFou1NZtb3cwX8hbw6G0R2bqulYY80UQE/oMH7cNMgXapT006CY9ujce9mfbnIJ+C
	napnIvRdRzzgMdHfeqoNU6A4TPJRcgMxaDWrg/cklzY3J0wAXjnw1tvWYKQ0CkRBCupH3mD7uYa
	HKo8el9W9g0eHEB7jB5Kybq9HW/wl1erlB8H8K+zxXEB3MQe5XodNLeLfl2iJri8MRfXCOpCYyx
	N0ANvzRtRR1+l0aiLI9t7iBvYn7rNxUI/kE/pv5J7pO80g+zRlZYkq9hekGl76/zXizeFAboVoB
	5JAswWSu5ToDhiJTUONzITNtH2yYiFaTjVDbhCxVga0I7BnvUSjEe0bYbA+C36xn4aMN87O2BLN
	cH5HqVyzWmblZJ0LXpY1MLXEycwnGZL1VKzG+kycwSr6a2wFJTJwmV4+OcUBVYbast0GoMkS0fs
	KI6d0R6S4rpLKhBB1Y8s6Rx8NDUQpcoc1TPhUMtKEks9tVBKXy/Ecsh+QQUjKMyqFlq7R7SuRSX
	NZ1CVtpRW9HMQlDOaYWSatwPy2CcLRQ6MI2PqBKCGlo+e/F5MtM8NF14Clm2ZXSd+BrgKCz884N
	jZhU0gU5ZaGesS3jl6w=
X-Received: by 2002:a05:6000:2a8a:b0:48e:4300:c6d4 with SMTP id ffacd0b85a97d-48e5d5e0178mr9303138f8f.53.1793267730108;
        Thu, 29 Oct 2026 02:55:30 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:29 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:11 +0000
Subject: [PATCH 02/14] media: qcom: camss: vfe: Add eof_seq to vfe_line
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-v4l2-frame-sync-v1-2-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=781; i=bod@kernel.org;
 h=from:subject:message-id; bh=r8I7/rYlBoiTs3XMbyfUM2Y/UeJQUOmnjTuddw9Fy/c=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgJDhjnEgkNKVNQNwb4JYzE3b0iEaGONJtbt
 xnwhCbBrGWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYCQAKCRAicTuzoY3I
 OoomD/0ezDgAxXwhdq0p/DZNxB6vRZGKzg5HQhGajBH4dE/nhsLix589Z1DRnmnDSltK0ZS0ERp
 Ygqd4SCFqK+uWa9qGl6lmpzWiUTIaMwbvgKGCN3oVI7WB+J4O8Dy2KxECyWWaSIjZAkqCMVi+OU
 T90NRcn9zawK8dZSFOxAW6832Nk5j8q2fsC/taliDiv9snzHPpQcw/CZwLBRXa6FFvjOJuuvmdq
 Gkt+UD67jHxpWzZNWhHI+fU+oat/UQ/T0felYVHSCK0U7rmTZ94Pnkytyr4Q7fouWPWBeOzATlB
 eNraUpDEyoLgLALI1iZAA7X4JEJTwfufxkWzVaU/YGA2yXaPmVwCiV/GUqnFADotZiI/7yVJcUY
 nzUG+U+EFm75Ed5uEed5LcMYGcEpGJ7+z03xWxIh1fhDuTr0NyVc0usoDP3Fyjd4E558ZXU6FuP
 F3UsbeQli3EiRpMIXgWLn0+wQwQFSjOUZqwVjMaKceSYJfpdPyJk7CAQrLbMd17XhpyphfbS58e
 7Yp5jxAXlAz1AwZkARr1a9LdHj8nt7pGudR0jzi1NR3pIkANJWPWJv9FjOQl3ETrlsojrSYUTdw
 dATlUNM4Cr6BGO55Gh9gZgVPqjTjVzWLVcqdXO3axJ8mPZqmSMS/Yh7Emo67DWg847J4filP1NU
 rVGHac6FfU2JN3A==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add sof_seq to vfe_line - this variable will be used to correlate reported
frame-numbers to EOF events when the underlying implementation supports EOF
tracking.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a378..2d38133764b6e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -94,6 +94,7 @@ struct vfe_line {
 	struct vfe_output output;
 	const struct camss_format_info *formats;
 	unsigned int nformats;
+	atomic_t *eof_seq;
 };
 
 struct vfe_device;

-- 
2.56.0

