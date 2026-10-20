Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529198;
	b=kOwl9xrI6Lj89Nz7gqIHU4cPZ7Y0Lm0ojE5zgYmdJuE+/UrQsKlSIIL2aPG8vL9vgYSY
	 daJe7K5A/ErnakKK/2vDhOm2mmyayngSvEdTwr4LyyMrbpoOs1vgCIcdRnFfltvYsmcxD
	 QDJRzX/lcQXR8pfMPhg15cmypipPOrQNbDJUgtOFqxW0/fpaEmi+H6haUlqar4Kfeae4y
	 33LwdI5fM4MB8gtNZ0FeYvJr2uQ3Y+bcGAfsIO1AVd4ymD9efgJTBWZyxnjaY19haT5aH
	 HkbAhPnwVT58ydmUt6O/TXYPqV0OoFDIAKCAbkN1HXB6NddbtCzGdSoqpr3DM57sOAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SzV5+z/r8UMr39IPMHzKFVdGjgJGBmTzawGLO6TTG1M=;
	b=a8+9zFEX4uTX9Ar54vyaaxN16gBMVzfvyIGSYIQN5yW7bRHR0OUcVfkZEhyPjCcbDcKq
	 DtBzR4+O1ODMeQM+PFFsxzrHJn94lR/R71P4qy9+z4KqCPjMugnqN3knqsYntEKKoQhH9
	 i4sppYf4YTmyeL1Z7lJ125eGJe0cfwdcBdYJYk7wzBl+JNhwIQWYbfU/BK4lwJDPGRVgY
	 +shkbi7jrVJGHztKAXJ7yMuokXPQsMu2zQTt0plEaNzo61lnBSyAeidkJE9eZo73kHFp0
	 YlnfprWghH1IE8EVhU+6PlhHeeDL3EzmN1MZ0G+gKJe2FFYtWLWB0pNG2TjKhNIXx5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DB7eOqrC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z7jw5Rjz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA94606A319
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 20:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDA94606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DB7eOqrC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z7jw5Rjz
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGtWA61375705
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 20:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SzV5+z/r8UMr39IPMHzKFVdGjgJGBmTzawG
	LO6TTG1M=; b=DB7eOqrC2guZxfoLr+G4n4ZtWrYGktNhRE3vBY0pF5hPHkvrWmF
	34qH7x0l9xlRKR6LodQf6rhIUdPOemOatoAlminkuHOtnGzT14r4oY45IIKGWbX6
	mtA9wx0pNynHMBIXAutXhzfCuehup8KBY3fdNQ+Nr2uPIitvwSlI7rSCd88yS10Z
	rzKW3xQNqX0We7vF7ma2//QedQ005HlGR8j0E/QbBoCvhYqHyW+RtKq7//pknE+w
	wZXfwRloKhcadRTq4N9jpJfP0gg9g7jXCU9ryxipK/p3Mqe1gnNio/IBl9R+7MJO
	eKMnbApzfIf/NkZLMhRfKSihfo/Bfo1eNCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd0w9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 20:46:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso16373785a.3
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 13:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529196; x=1793133996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzV5+z/r8UMr39IPMHzKFVdGjgJGBmTzawGLO6TTG1M=;
        b=Z7jw5RjzGVKrvXH8QpFELrryn+h+kXwAUS5+gc0poBLNpCXAzqhiyM+D9ESGzuZXxu
         99mP1qkAkayVn9IqGaPqx/vVZtBQmY0RIqaqJm9XvWYQuzwfUuyPxYvBCjiQGG3p9ZTR
         31dGiNcQyWSZBX5qh0GTE0Ata4XyaFz6591YHFvoxZjpA8WCnJYKPztwXL3WvxuSTIhF
         aO4vxWEP2OQx+N/J9bJESKZ/ZPEKjvDgzoCrSVyj9YepO79IyfzPLQmjw+D90813ja1h
         VoyZh63WOAoL6tVMi2Q83bFt8vhcpNtOZlLJhdXIU2WDpq/NR3C/P07P/Kbhv5uygm7p
         hk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529196; x=1793133996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzV5+z/r8UMr39IPMHzKFVdGjgJGBmTzawGLO6TTG1M=;
        b=CRGcXRFdPnVmB1kHQw/aaZgrnKuBQcdZ5IppdwE11BfyHrMEtiAB/TIexKs3ZAHjD3
         e9sPuCSIILSTNMvKxPJtFiIR7U1zSDgbE783xXabaBwYFkJsg+8o8dkLFV/jokEpty7o
         yzCnGzcvLMhKi4zpKDMhJMpHOwpPYHTzo7W4rSrHWKklpu/jmx8J8MfRzoTQ7ch1NmAP
         gFro8N0Oze/uAqm6lTKck1W5Sean3ASpz3nckfgvbCKLuehBrtvRtJ2F7JIbXX1EZ5lR
         05I3Xbb7ojsDNxu0yiPXxKXpxPfJTLxt3M7e8gpzA5fmLPBrC9ACy1f6JUaMHhttbI8z
         406Q==
X-Gm-Message-State: AFq9FYKXLrJ8MLM46dtsBpIkJVi2pB4kl0bUiRU7K03zGjFSzzfDrzxF
	ys/42IO/muoAHhjzS6ZO+IQyJhsxa6vbbaEcD872AaCY62z6vFc6SrttoN8IS7yg3+B8bp3inkj
	S5nEKf4R38kc2cNm3+im9kGXqzgOGlJiXLjL+1HGpE6o9J25dMv/jjFROmp80fHunPw==
X-Gm-Gg: AYBFou3oaqdwirwK8VFZ62GRoLabYOOUsGaNSTJRAXU8/alVGU5RZQrg6KwxBIMU/of
	Q0QYI8M4eL55/NtOiErtXqH8PWA3zy3ZnQp/qtpDfjGoZ/C7x52RKdcqfCjCtYjW5qaGoJGjENe
	sB0PGWLRM6PxNa74ngWMQzMOYQ4Hqi1kEzYGTpedtg4xhDMSFn2jSQNrzNTMOXHhuT8W99vbFil
	H5feQaj9X1Ta7tu7X/RZLVsKUBx6oyj/hAA74RZXI6tzR0xeqIxsKFVl3j63NJrZiwzUDzyiaKh
	MDXo5015pLKVnfxgsj9RLhYf2dcT8m0yyjO85SUEVXuTaY56OCssAWKl+1Kx8hKEkQDy45/nps3
	r5enYc8Xxpg==
X-Received: by 2002:a05:620a:8006:b0:93e:bcbf:88 with SMTP id af79cd13be357-93f57ecf44cmr75478785a.4.1792529196104;
        Tue, 20 Oct 2026 13:46:36 -0700 (PDT)
X-Received: by 2002:a05:620a:8006:b0:93e:bcbf:88 with SMTP id af79cd13be357-93f57ecf44cmr75474585a.4.1792529195574;
        Tue, 20 Oct 2026 13:46:35 -0700 (PDT)
Received: from trex (50.red-81-37-172.dynamicip.rima-tde.net. [81.37.172.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd59482sm4536935e9.4.2026.10.20.13.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:46:34 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
        stefan.schmidt@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: qcom: iris: fix PAS ID passed to set_remote_state
Date: Tue, 20 Oct 2026 22:45:57 +0200
Message-ID: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX8QkPohLZs7Cc
 4dq6kOT5DXD9fN7kZ92b7KVGJcOxFWzLkKeIRYg/nNHgAkGz3NEO/gvy/fPxfLyTp7YPqDZXXMJ
 926TJeBQ7q6x+GDwYIfLicshW27p8E4jALQER4x3r2PAX02w3M14+6V5R2vRj+er6QSN14w0t4k
 puIIRePAe26W3gQlR86ZOWjd6qaULT46fqCEryWnMTTy9vQ6/Vi9JjOfAu8iViO5/FBa9xr5T97
 mmJPGv6WC+v5gFoe1Bb2yojEhPf+ch2U8F7zpiDyT/ZVzekAQyqYst7mEko0vXBdZwrSdUG+XqQ
 RuNsHRMewlQ5trhHRoSZxFoDwpSjgYI316srGNvDNXW4sPEuHBTXqC14TXILQyXKanwzv1k1gLu
 z7MGRnLZG1YfBnPbKMqE7r1T7jvXIFsLz0bhT/e6uNvpXzcDoyAKrUHL6WmT4v1GG7c5cfrBvxt
 BjH+w0NCodOr1RqOLnA==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad7d32d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=VbO86HPdXvN82gCvB8O6pw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=mLYu_wAyvM-e7FxXmqQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 5yG9c_X0aP5gpskEdnoDbRMuwufJZ8-c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX8/RuECspRzD5
 pSFybeZNZHWucZxkK+5PBpuHqmgx/JLA1UkgWXbhcMxQfTwh5muL+Oab/UpdLs4ujfgTuJuNoZM
 4FdTn7mEER6jTvYzqFlu8RPiMwMVCyI=
X-Proofpoint-GUID: 5yG9c_X0aP5gpskEdnoDbRMuwufJZ8-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200082

A PAS ID of 0 does not identify the iris peripheral, so the
remote-state update never reached it. Pass IRIS_PAS_ID, as every
other PAS call in this file does.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 21cdf1c39835..6ff5eefff391 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -195,5 +195,5 @@ int iris_fw_unload(struct iris_core *core)
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
 {
-	return qcom_pas_set_remote_state(resume, 0);
+	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
 }
-- 
2.54.0

