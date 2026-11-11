Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387963;
	b=f64IVk16OVImD1rY/mMojHXKaGQu4xq1sV2D9fQXegjrYHsiSLAf5pcHgOONYLfLjGog
	 znKFy9CUXPxo0rYAqxV3QFMSrL06m7zPxpqA2oJ+PI7kf3iNuqn0XFiEc1ap4GOfJSECb
	 FMVZ/G3cuWKBC+yotWkIb9PCobeejh07hMhTeIpOSTucHJukHlKZ9ZdeleNA3l4/j7yU1
	 D5JQ+LYi6bF7Mwp7ulQqajfY7TtC7oPW/2zM0rnPkPin3NincZD21pnjekJHftuWqG91d
	 ZgIBy/FdqFcjzAY/caR8jJ2qArA1WK3F/YOYFLZtRwI5sUnX4Vky8MQxVD0Mk7NJqKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=;
	b=Cv7J3EEAUJRNC6SJzy3yKKfzfWsvdnJBf44m42CIaJD7GGDQjLZrPCY1TUpNN/wVLZn4
	 BZ1ZP5GuJoGOhP1or6mwmrCI/voJ6F59YbGv1r0vYFzkHfcxt92AD0lV7T+wt494XJEnE
	 pZGY8GAkjJz0gHSniXRhoPzxLw6FSImwub23fxuIxqSXTbpUK79OYXGyQq+yNJbOZPASC
	 tvVXaSHl7Z/zAz1ix0Xntlc097zn5u2XoDGkiLFNF3mjF2fHHUxoaCKeYcG4QA0T82CYE
	 sW5jjhZ8YRQ1/XAjjsdpZiA2h7FBvnO7glYAvb5UGZHDouLe8slmnTGJm8vOgJo4uKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjoqT0KD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZJGlam0c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E184B606A324
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 09:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E184B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjoqT0KD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZJGlam0c
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KImu1386358
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 09:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=; b=GjoqT0KDHuZKIFSG
	gcxLqcDBpvdsaHA+ld/bNgzJmDDQjYjLDqBq+/DJowUtCWxj5cnbxpeMkk6II5H0
	7Ho3fKM5Wp5VOiIVGWP8ccQ+ekArZmiuWOQeDgNogB4b3SpZRYp6BMa+UojlGNEB
	dLf+tpB+OGejv3moOOPjKKbv+AikqpuXzLh9O+7W0fryn2MdskF1CNqWzdOklH+5
	YAHWmsmEyOkvnxma3Ik9p/6KQhznjXYYqsFlqhY10jWZ/nB+I3YQa0+7myXuIK2H
	JyT87ZcyfOgmuSUhwupaabDiXqQkbd4NEh5dv0hyQ+hqZZXkMKa1uOYl0Qng8Znv
	8IxRJg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm9rue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 09:06:01 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so5802463c88.0
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 01:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794387961; x=1794992761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=;
        b=ZJGlam0c+6Lioimz1kS/934C/ja3M2MxHOwDhvhMtSjqg8rGUG0BWntwVI2WUHULtv
         yluKwgUdoaJR2E/v+1aL2kvvqDle4gNOg6UXadU8zWpbKAN0LPVI+h6d+sYdS6YEQME6
         mIqwkdxKdkRrgb+Eay7+Tsqe//viN/JbBKsvMXEaA5SOLWRhSA9XAkeXuzotm/1cSoYW
         fh6trt3nIaIUHbKYTtlIZuGVm0bDHMf/6QGhi4mIf2TWbi+8ReEfTMK3RIzQJ6nZer1H
         Q3ac8xmlyi8reENp0WFjHpI6bd8Ea0Iy3cxE1nAx6JcnwMCo38WpkT7jxmfgyW7C/czO
         1kAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387961; x=1794992761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=;
        b=wVTouxR7zhcRd8Bj4zs8uxRu+V3O2V6yMCHYVh8bV+a9SNtnHKm9idhUqqAZV+sgys
         bTcI4itSlMsJKKkSun+yYFTWCa+arw4b5zKx283ct8BAx65OPZPeBTPpRngCvJCO3+0a
         MnIGAJ9/tAEeR1rdmlEz4ZQdwjmHxEXtJm5BVuKUKBvSQzQ2cP2AEBcg0ydDxN/9tbuz
         XGyi7FQUbJIwtwmkjZXpFOv9ja9kytdE/5mSyDf/4i1WaDMiGdpXkptDgGeyCs6h67PF
         WSyzFBZ7Zr1uy+uZ6PeW1Ywp7ow3jrtEhzF5GV24zYbIznXZQkQRTnK5DAss/28LJZTI
         rNHQ==
X-Forwarded-Encrypted: i=1; AL+hErFIiK01autTXpSUsefgnXaXXfJJXmkGR/N+W3MofyDteASNhdIgM2exyXcQcT974Id4aU9KltyYzD+SEA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9qRNhY46Co2j1t+fRVifCB2x3XQD/x2d8/2xptU7e/rBUnBRVg
	O0rWUBeuheIJse0eYJ7dz35ah85LZth/DTlA+7oCzLzmWmmHAsfgc5wACJPfvCc3R9mFRWTpOtf
	Q5YvRkAQoJCUpr9TvVlFkhtpBFaGGo0L3XLvC/q1rprPK5a+Xr8rKEYuZB4+QXhBRVA==
X-Gm-Gg: AYBFou3F9vTlZ48iZWY47QqujOiy8UtJX3S3vAMsjDtT5W2YMwDSK+rQkiQL7cAgSNR
	5LawEDH8+gy+HThYvfRVC9BoGqty1K5ZgrDuE/1lJkAj4DXMZLhGezzMJSrd/QQX0K0RofwaNSp
	YzQ+eBaXjQjZo+aGeSPlbmRgc+se6hMuc+7lFc8s1Y9z4VJni32VErtkEWqYiO0MflSlec+Mysd
	J9rzHauyk/DNQ+3Xs6zIXZFOQ76nUrzpj8C68D4rW79DtuSWZnSaRgpAP5OkceCginYC9IKq39o
	W8VajbUu0/zLLyTvfGSqK9EY/lEzrD6CDOaDVjGnkSf7ZkW0qBUGB9MYkIVyzEu2dDBjFIsJqNc
	/vc25nKNGLx+7iN/yZSFlSFf6Cmi38rwxCc0xfqlH547avUOWr/yWP09Fs2p9bo6T2TN408zy2V
	BtDRqQog==
X-Received: by 2002:a05:701b:45d8:10b0:143:26eb:18e9 with SMTP id a92af1059eb24-1b3c032d6b4mr1818541c88.28.1794387960895;
        Wed, 11 Nov 2026 01:06:00 -0800 (PST)
X-Received: by 2002:a05:701b:45d8:10b0:143:26eb:18e9 with SMTP id a92af1059eb24-1b3c032d6b4mr1818486c88.28.1794387959552;
        Wed, 11 Nov 2026 01:05:59 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2ff3bsm16915277c88.11.2026.11.11.01.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:05:59 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:35:14 +0530
Subject: [PATCH v2 1/3] Revert "media: qcom: iris: use disable_irq() during
 power-off"
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
Message-Id: <20261111-fix-disable-irq-safely-v2-1-8e13f68c2ef9@oss.qualcomm.com>
References: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
In-Reply-To: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794387948; l=1211;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=OJRJ4n6Rjp8IwVJxm+5+cJyXLWroXFMzWgufd/STv+8=;
 b=OTeb3Fut9eI17/5ZEOA+56fDKV66fy8SrYjYvNGchCAucQVvQ/T0uPh0FhK+1CLl3eSZ74GjR
 FLwQB8Q7PQaCSEcrYuBLpEqbE880dxOT65FHw3rnqWpKoXDymmadW+2
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: BI54zcMi49uXOyWDrR7Krk_J3Yb3NFXT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfX1xbCE7iSDZUW
 I7DoHpW0MovPs+19A7SLrKHVeNfca7TkmSyc6YdNDEFKjiO3jMJQ27GBKjUKrGTYFQvLXO/5Jy0
 HWVHE4EcDDwkG3NvFThrwNmyBIQzZwI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfX/81MDxG9cgUx
 aRxb2JsG84SgfysmSIDlSCW1NYQfO3UbniAVXP2Pir61+QFtONaNVWMJuF6hmnFj3iBAW9dadYC
 kOI04jEHy4vOZblChoBGvhibja9u74A3aAXTi2KoNY/BD+NEpm4JlulkLPWWB6v7lBea34iAXse
 tNJ0EEa/eCzS+jrQNMUzu/VEiPqh+aiN19Db8YkwaOcVleU2S6ZmpZhSixcyxppvhMD9W4MuSZI
 BxnIQjrjIfv+5KpuFA1WolaMk80XHZtl1OLPJzzzSuQt56X44rStbWGwB6DQPqpvcrEmGyobLRi
 +jSn8qin3arsWg7jRhhArxv+DpNXulHSuvnxsd7xUMcUf65mFJVfT5fpHHMJBUka7vaRpJyxwD7
 uO9WkvAUG6LUOr873IykRFL9TzIUPC+FjjAWSvg27pfZNoV2TS7UQ2uyiaWG/dQHN2eOsFXArf4
 RBKF0Ei6heh6SFPXiAQ==
X-Proofpoint-GUID: BI54zcMi49uXOyWDrR7Krk_J3Yb3NFXT
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af42ff9 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tjrYt7ayRFslicBUeoA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110036

iris_vpu_power_off() is always called with core->lock held. The threaded
IRQ handler also requires core->lock to proceed. If the handler is woken
and queued around the same time power-off is entered, it cannot acquire
core->lock because it is held by the power-off caller. disable_irq() waits
for the handler to complete, resulting in a deadlock.

Fixes: b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during power-off")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 243bd845349f..1e183fc4e58c 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -240,7 +240,7 @@ void iris_vpu_power_off(struct iris_core *core)
 	iris_unset_icc_bw(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
-		disable_irq(core->irq);
+		disable_irq_nosync(core->irq);
 }
 
 int iris_vpu_power_on_controller(struct iris_core *core)

-- 
2.34.1

