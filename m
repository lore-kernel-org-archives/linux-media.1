Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31F03F3293
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091167; cv=none; b=YSLLxQ+Z999POdE8NUWvDnsqnFDysZOoRXzsErhIwW38I5deJAu0jhRzKJuV4Y4zgAmD+wEBMS3Rtqz0XMEwsIUNqqsRFi9TT+fTN3tHJ5b5jE1KkV5CG84Zl74W6mM89q8pyazuelmNkdnnGYw9bBTI6fcmDd06m6zVyveSQjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091167; c=relaxed/simple;
	bh=k2QqCCh9X9jHuhXVXYKmeUNyCph6NCLcDyyxb6DSt9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QyAbzrl1R8Rs6ZWwR/TvGI5jXz+te03HC6OtG4F2r1THkQ0t5QZO4lKYv9yHBF3xSYE/Z9DTMTq8fGugbpvRdxj2t4ylRPOyRt82u1Jb2hOTz6/jz+raIYQcVx1714143Jw/a+wqUEtAmYqP9L/xTbGIDeKx1yUZ6yLoZoSMl58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rd/pIsCz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFf4h+3o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rd/pIsCz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFf4h+3o"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6776C3GZ3576166
	for <linux-media@vger.kernel.org>; Fri, 7 Aug 2026 08:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uWa9gET6WAVvUhHxtXVevYTe4vaEKY3KFNZ8ChrERG0=; b=Rd/pIsCzkCJ7sJkq
	hX3kY4lm0uNJK/x3yfsA2x27SYy/XvmjHFfZuKx4/q2cw9jsPiDa3t3as67dUtJW
	LVxvenSQMPGgMh3BLrM39e5F7TC9qInycSsGhL1TKsqjfLHc5K9/S9xlO/o6hLZi
	LncHGdDusJS6gfHXoQZIqf044EyO/zNATFg8p3k8FVS/Ctr/mObuFAC4N+33tke6
	xU7rt+YF8jqZSbjUcVISVWx0a4Blg1XFh9Dedw8HFMeUkV0J5+Vj10HeM2euES/E
	dMqL0daiX6pYFyiW5ipbdTdWrf7fhS8dd3wG8w1QEInSFcVi/lZQxcMvLURNk8iM
	8J/0zg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fw9vu0fgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 08:26:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacf17c7e0so41818395ad.0
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 01:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091165; x=1786695965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWa9gET6WAVvUhHxtXVevYTe4vaEKY3KFNZ8ChrERG0=;
        b=KFf4h+3oDVBWyUslgxxPZPN3GP1dbIvBqMG+txSfMYQ38+vhDcO1h8ihtJASYYMqWr
         MlQcUK29iubeciy3qWr3Im28MumcExddW7lPae+wNdKCP0dqs8p8vbIGmmomsiWBZrkE
         /LHKMo/qOjLRHKdSuYdUxhWsaor0wA9rUeBL6SnoERuvoWebcVD1fHpQsiZcixU0bALr
         2AsrrijGk/LGTSkRcR2yOijKmUrCDpdKj7F666yeGWTe1hngRzPC5OjxILh7IF5Dyahi
         /EvKCHjAzNhZ0uIM2/WORei+VTz4kErsPB7UGiNPVDb22KHnZb2y4zpGCAkxvgGkX7nr
         5Mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091165; x=1786695965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWa9gET6WAVvUhHxtXVevYTe4vaEKY3KFNZ8ChrERG0=;
        b=Fc4caPK/P6otcp5fH/gnZFUZx5XvAgQhv9gltpK4LW5hsL4ygMsbHkl9nszZsIOIUF
         6hklpzYwrzeaHFSRHEyL2XkpfXnw3Pd7jCmtTTXYvNxGpycs0+BUc4PmoOvz4kGTcdVb
         IIii55VaXz18pi9m3LCKWjfZCNiNiYo/TLKj0ZUzoUoWR1lFODvIGjHOOJC6xO3/NBYq
         /Tm3cWzt2Td+M9uPwNi20mNhswxPDg1Ayx4qox1lPeaAPQUHikZ1IOZcQCm01Q1OLvVN
         n2Ru9Xh3VsKCSkgjCh93wh2E+NJjoBxQtj94gZp3xhoePOaFyN0FulEQxv/r2oTUlwnP
         PjrA==
X-Forwarded-Encrypted: i=1; AHgh+Roty9szv5nFjiYRxGIJLIZUolX/pna9zsYOTh3a0fh2OY9rJgvC5MfTOSkE7Ztc7IxPMWMkTmMsEhWfUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEiGALO0wBrDl195Nc5oKeTmXt7P+83s7XO+v2h5NZyTf9JyLk
	CU61Q4n3XE6xY07lFQDMjbrZRCb2KrViJ6UNYti+kUaYOWBZBCk6rzxEawgQ3GoswTSrFkxaJxZ
	IvZaLv/FnUbEsLEH4TVZSdnIAfL5+ZvjNOX8MsNkVoqNu0m5vktORDspUhov45redWg==
X-Gm-Gg: AR+sD11bQOQ/cisBmNLCNpIpdYfNyAC6mu31Dm1gZMf7P+I0e8jEkRDwbjJ2KJTFU89
	p5Rp/D4U5DqMwjbjkG/upJlWwdUEj8OZBEQDKLsIn45ATByHZROmq4oy52r8L/ehYrzodrqDOZ2
	BgwZM6Nx/idpq5DyTQ6On9z9jLT65tVqCdRre4HiFKHEAhu81Wjx0tuDCcKVKEgv73B3LMX2uYO
	f0IMT2AsFH8uHVCAu6438KiIKwcf6GQERKFaOdOu4ox5J3AW6iErGwCbMuEfzCQtsUFqoas6Bt7
	fPNDlRA6zfcK4jMGjy+1BCuQEtK6tb5s/5rgRPWnGJIax8sbMNlOWDgKCj4f5NsAais700P67Cs
	YzqkNpPrOmbBCjxSMRX8qg8DHjls22WALOxY=
X-Received: by 2002:a17:903:32c6:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2d106650dcbmr77510245ad.0.1786091165061;
        Fri, 07 Aug 2026 01:26:05 -0700 (PDT)
X-Received: by 2002:a17:903:32c6:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2d106650dcbmr77509915ad.0.1786091164607;
        Fri, 07 Aug 2026 01:26:04 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:26:04 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:47 +0530
Subject: [PATCH 03/22] dt-bindings: media: qcom,sc7180-venus: Allow IOVA
 reservation memory-region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-3-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1453;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=k2QqCCh9X9jHuhXVXYKmeUNyCph6NCLcDyyxb6DSt9M=;
 b=QxFev80+LYxm6vHDtmI7oG4xa4xX6nSDpEXDR5undg+BHuYkeyecUmgHxEtRXsJ9VSN76xt+y
 yZkUXvpA1aFBks2i3lB565t2MiQcQ2PtjzNC4S8jZ9sxUJrpTZMTqpc
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: 7vRAnbBfAWnFhk7BwAQRWGQsCOflQ9j7
X-Authority-Analysis: v=2.4 cv=SYbHsPRu c=1 sm=1 tr=0 ts=6a75969d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OD5a0iPE9_tbS_7HGJYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MSBTYWx0ZWRfX20UsDajypDGE
 bMPaouUEcXZRHtFqvn6tPjl1JPGn/c0LzKoo0S2WPj8O0wZVnNuMpLEj60OQX+t1eh81pChZMIR
 owqmjLTWRubl83x5qexsDfKNH0eSch0=
X-Proofpoint-GUID: 7vRAnbBfAWnFhk7BwAQRWGQsCOflQ9j7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MSBTYWx0ZWRfX6zKM2q7UPYsv
 t/Z/3A18HcnthszW/wwkyfq1+qRXrqk6QSsbkdFtKW8fek2gpCITkp2C5oY6h+xFY/YpHY0EndY
 mXKg+PuuM+knSVfQPzaHvDIuIlnvaxxCFDaVWij1Xn1WtPZ47IqWJllEqDKoNlAlUHD9AteS9xK
 Y/ozTIFCZykMx/smW4sRXZiKCHx1gVfkfyiT+cRQT5miKeUd2+DIoJO5N5fWI11RlxNVBqS0WaZ
 PAsyo/pHJUyNHqBPcSYaWTRgDUA+bRWI7SDCIVTjLBHqa0gOwesz/ihiBXzR2rPtgpB2AnBGKBK
 B/zWgOuhwXiCC/uUc+3kV7cPhgiSCFROMzgWrfsLqgn8HgzqjXbr0b8zeCncO45s602Owg8fkt5
 s03rmnydsEWrOgKJRkWOLy6Q87pUyit4vEtHSc9uMrv4qLrS1IsXQvcrDVYWBYFq4JdCxjfVSad
 tNJUbWSMGkaGz1FzMDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070061

Non-pixel stream IDs should not allocate IOVA space from the 0 to 600MB
restricted region, as this region is reserved exclusively for secure
non-pixel.

In addition to the firmware-loaded codec carveout, platforms need to
declare an IOMMU IOVA reservation (a reserved-memory node with
iommu-addresses) to keep DMA away from restricted IOVA range.

Permit a second memory-region phandle for this purpose, and describe the
meaning of each entry so the ordering is unambiguous.

Fixes: 545d984cc90c ("media: dt-bindings: media: venus: Add sc7180 DT schema")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index b21bed314848480b82153e49602f0b19e08e7335..52de5a5465b0f0b245b55eac6cd1acf16a00f7cf 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -51,7 +51,10 @@ properties:
     maxItems: 1
 
   memory-region:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Firmware-loaded codec carveout
+      - description: IOMMU IOVA reservation region
 
   interconnects:
     maxItems: 2

-- 
2.34.1

