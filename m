Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595801FF1C7
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 06:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480343; cv=none; b=om04DNG1rIlM9TIcc7/bi6savUH8nmErEqGoF3F9yDdR65EJvAZHXIJCebKJdoZSZxcGbsfTfnCoFoAnOgDviGWAFp8lh3VZ66AAhS5b4sJzDSkQKnlNku+37igljg5lCiXr0q57/yDLKiqS0WIqdqxc45L/qEQPljEVUMkPJkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480343; c=relaxed/simple;
	bh=SlQ5VdwZvVStQeZ2eNH8zzR3a+C3sg3kvTYpgF54crQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLkIQMgNNFFipQ3SEAH4TByqLW11r5z0vzmF0VIy7CuJ3+QZdArKW7ls3cjrbRG2jsr9QQA/2aOGwsSLvK/Wip7kPulTovz81jOSO0LLTt5yTn5TpBT5bp58txhBjVf6xbb38vET7Z6h0YrmNgEk8Zd3UwRIn8mfdE7T7rGWmFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adWYO4vO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ad13c3Kg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adWYO4vO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ad13c3Kg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V67ZIF3011084
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 06:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=; b=adWYO4vOwJgRdG/G
	A8CKQSxXdVGZLUX6WWrTyQJ+g/QDgimY57Pq5Ug4RAlTsvdKWjf+l10IsRYRWIRr
	Cl9SjoE6BB5D4DhoRTkD852YbG3nUijwtIyHxO5mhychWgP8bqiMMjw8SpuOOUzr
	64FBwWwIu4g3VfKokQZg0XweK9dbi0Aj5ew5XYDjYZ6gic6veqF6g4D1P4DhA5OT
	ZrcQSOv7fZEiDF9UggXD8pSXUT2sAL+RdLF+apZaGZsHRKjGhHrgdYny09anVUX7
	ckqfSOz7HNRLoCm3l6PeE22PMOf5sHlOGLTWX5irfSn5WX3EVz6ROeYcNjQ7wUOU
	mCNgOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp5n84wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 06:45:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934993d0f39so15090085a.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785480339; x=1786085139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=;
        b=ad13c3KgeuPQB+KwLnp/UEXzSkochjFxJ9Hpz7EUSrMHGnA8rVtIKlH2sCy/CDqNZj
         sMUkEOYWC8cu032vqT4W4hklKKXfb1fBZkS11nO8GzEFZYpqcOoFHaF/r3GbqVe3y/Oh
         lEsZsReEVs8efuxSSH2zL4DwVs9BuUkc2vDr6P7+HTJcxWHmSDzZtthwI3pmsPRVv6rl
         fZTNuFRIe06frdtV6ddoaj6oVNQWokJpwEzYYaA8AbBSd/x2xKTTnNjJSW66Ka3mwWSz
         2iMVK4+GQ0JM2IsH8CcQowLlPB4eSOhlRAlT7J6PVdk9RMzxXwzuU3ZqDEIBB7Y+A2pn
         XLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480339; x=1786085139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=;
        b=BZMvhVjEeAi4MG69KCNOXJSWHMpkzfZW0k8Xv4GjXS6sGToTdE+6GiXXKZWOxOzteO
         TmsjzBL2niyP1uDiqgm3eQ6nXXI0veFhuRiFYGemGh/d9ujvYdH0B8XcehhXUhdgQK4v
         sTQk0EGpFOMRH56wwJRh3hCL/Nv8qBiv+VHjMFWUaFiqWnyn08IDy8Ua8pQqgz9afEXN
         35dpk/+m6eJs2PkiM97yr4wezyY3aRDLR49TQ1Tn0dbHIwkESnbma+74Dw5evDddgn8o
         wK+qIawR3ftLD4oe49qlogDecEBTATB91B+zSG35ih7qPNjwqXSuie/4zeoH6C62qOCJ
         0Qyg==
X-Gm-Message-State: AOJu0YzVfNGOdg9koQPg+gsnVPICTraiH9lZr9rGp6M8SaM+LMlKbM8m
	LJoFCyLiV/Wdkohn3eaifzVilZnA8zUVrGvg0FGurEm+rfW3m3dhQHMOUhUJaKZUbSAIuggC2Xu
	FTHwy/aiUxZJTw6NKZMqjVOjWtrZlVvsGh6rbdPBsASmG8cKUJb1VTzOc3EmWaFN4HQ==
X-Gm-Gg: AR+sD13FcBVk3/Gc8K4thi8AeHR595dUUJN5hJIWqEOTq6+EiVmPJVprLxRAbvWX3gu
	Ct53ulj6KvaFLfLRdNAgsXdAl4WRUGtsWQbeehLr28dXpU+sjnp5j9wcUfPiXxMrDoJ0vtNB8vm
	DVnTj2udzGYbE2Ty6CwbtaKOL3lNPG++xrKL3SGYGAJkWwagUpHTSJTDGyMR2C67xhKVFRZlNF/
	zHkf50fftSR3twIVn5RH53C5wonGIcTipQ2iBZd5uvxWUW7apariiIuOeQIOC17QMf3IqQLBgiX
	1VI+dNCa3Sv1UThAXqCme5kBWd3pHdsNS67KBNyhc7p4BGyPp6FeBOOaL8JuzURlRZD3syntXcl
	vHkh2VTk5kt+c7tF9uDw1HUXv/3qv/WltssapcT+IcPYOhtgJb4tfcRx6PsXxrihT8Pdf
X-Received: by 2002:a05:620a:414d:b0:910:bb22:d426 with SMTP id af79cd13be357-93499b29b89mr44140585a.33.1785480339454;
        Thu, 30 Jul 2026 23:45:39 -0700 (PDT)
X-Received: by 2002:a05:620a:414d:b0:910:bb22:d426 with SMTP id af79cd13be357-93499b29b89mr44101585a.33.1785480332259;
        Thu, 30 Jul 2026 23:45:32 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-934971773ffsm46107685a.29.2026.07.30.23.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:45:31 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:44:55 +0800
Subject: [PATCH v5 2/4] media: i2c: og0ve1b: Use monochrome-appropriate
 test pattern name
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-og0va1b-v5-2-c2b90b601241@oss.qualcomm.com>
References: <20260731-og0va1b-v5-0-c2b90b601241@oss.qualcomm.com>
In-Reply-To: <20260731-og0va1b-v5-0-c2b90b601241@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785480319; l=842;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=SlQ5VdwZvVStQeZ2eNH8zzR3a+C3sg3kvTYpgF54crQ=;
 b=2DQRx1++4zk31hdYTsA1ieBxVttN4ZS5A49UTh3/vBvU3L6iwD81kRnk66/xlHdNmScErKxRb
 O0pWAgBUvk9DQsXiM9527lpqZkYC4xWwj2Iff6WEWIn5a//Y4XNAwX+
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: WkfddAy52uBtxloqapxNRJkZX021GzqM
X-Proofpoint-ORIG-GUID: WkfddAy52uBtxloqapxNRJkZX021GzqM
X-Authority-Analysis: v=2.4 cv=bKwm5v+Z c=1 sm=1 tr=0 ts=6a6c4493 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ni8zlDty7YU4e_isgz4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfX50/hMvETyLpt
 g0xkoWyqqEtbg7bOZLNeGbG2epxsvJxnEYuBegog+Kzln1Al4Oquj/xQ5nBaFcEngjJnyHDLMrt
 b9RLg9TcdqcN8wZzzfjmf7hridytLX3u6Ozpf1fF+zwZkk2QZQzzNwlDqeGly7PDnJdY/uUy1FA
 L74C0rTXOtj57kfMaLYg6YeLiRqyREbl6INreKv7fplr06gPoqDes2japKF3L0fmLYjL9E9MV1L
 5mXCBYQpBedZ+sEefCcbQI90mP0Z8+eupm0pdtN2NOS4PUkw8cgTF9khe5TcF1voqtN1r29IFag
 IvVdhyoCYh/5xAnn/sTUZnbOJ+Grp/JRxXP/LG+zT0LVjK9v4UCTWOCC+uYrbxBAXyPg5nm9Qe4
 pFIhTnUIWh/G1mrCAarf08xYa85dqXjHNzCpp7XMPxz3n5vDk3MTQJ7z6MiRciCMMgo62GW79Lb
 qiauLIExDfJyW7KQEIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfXxIkNwzkynr6i
 sQ0zzAgINW2Q2GcBSjHrXIK+/R+8kX8kL6HuypIgr9r0TZGAKNk7C82hb4/eIK9sg97mjSqQlcS
 q3dibZkhnrHfKRvjVzZ6c2yY2I+01VQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310045

OG0VE1B is a monochrome sensor and cannot produce coloured test
patterns, so the "Vertical Colour Bars" test pattern name is misleading.
Rename it to "Standard Test Bar" to match the OG0VA1B naming.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..da5c8e49d4a811f55736bd89c6922856f2e7391c 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -72,7 +72,7 @@ struct og0ve1b_mode {
 
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
-	"Vertical Colour Bars",
+	"Standard Test Bar",
 };
 
 static const char * const og0ve1b_supply_names[] = {

-- 
2.34.1

