Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193862;
	b=Y7TO5E7/C47WjpXxhHlx9pXxUPx9WrJ8syqlxnnnrcGycPOQ1ORga+kPkZVHNZT+YBBi
	 d/OuYCuk6F99FYUaS2ZkzalRdeKgI58wSYRiJbwUvUA1PWHazy9xhOHNo3q3knwPbJjFu
	 EwL7sNHbwPL2s4lWfQ9pS8EcMeJ+t0BVFAYVBm66GTI8FXXw/tdJWqe5oOhJVV136E1We
	 LY7k4bJQFPmfAwQo144B1KLqRGCyuq7ABswUlXmfBHOWGLyRKQ3mHnpWhkvdvRFAvofXu
	 5ykc6pp2S4usfUCx6vtyAV7DrFZc/cSpur/m2TOSIoe63PEcjYh61psEBxOt6Tn652w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QSj8rOP+2chmhd4OaxMY8VQerZ+RGTF3X9Nqn35HPWY=;
	b=K16/X/0GpTObtCPbfuBoY+J0FXXOoTDJbRkk/Sk0tAC4djCCZcxmlUhRvRkhPJxVuX1X
	 DWPtH9LdXbb1v4UPAf9JydSGNnW0ST0vSxgKu7LBJ6QfJUpy6RwCk2BwDYWqEpkPkT5au
	 LYmIQsduw5x+QZSW8bNPNJr/w0H4OoKnPqYeC28xbvFlVyoT28fT0GKwykUTTbbVAPpAH
	 smL4fLk6HI1yMyELhx0UBK+GpOA7IwhUPmNbewEi1J3aAlJDL7M/uXy5PHgHhtjz5z8SS
	 ciP+T9aE1CxPpO2TOR8HsRHbayYNTmB6yFKvrflbV8YJ6HmM6RMtF0cD9mTBBnXhJww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IHvZhKV2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=joKTF+B5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEA8606A32E
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDEA8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IHvZhKV2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=joKTF+B5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdxsS2082404
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QSj8rOP+2ch
	mhd4OaxMY8VQerZ+RGTF3X9Nqn35HPWY=; b=IHvZhKV2Nu7BJokwsqkIlNoxoeS
	bkqPrfGjXnhUohH08rH/pmuej9nYBQUdaCtILj7rQOTfXFiQyvnT1enzAwFGTd+B
	ogrXV8LqBy31Dt+y9XvSwBmYJsH6PjJVrHjf7u3k68HO+qcmnLQfcJ3/PH9wKjcb
	fCAMroASGnwNbvC0UFq+m8Ccz0GB+X/wzDh08feAHWB8lw0tgT5tcHe4YsN5e6/f
	Z6u2MAiOphz6WkX/wy8X9NBIgke69dhHM4zy2i7DmBJIjYj0MG7XbNGvdXgyO5pK
	9nPYCzqdqQRTizTpCadS1X10/UvWe3RIyqk9eH5aRpIEU5Iwh/8VDDvRu8A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpv5r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c7bb3e2acso15548316d6.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 06:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193860; x=1793798660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSj8rOP+2chmhd4OaxMY8VQerZ+RGTF3X9Nqn35HPWY=;
        b=joKTF+B5z7aTpudTGV9wQtmBen5Q1QtIs6fkz1UpBP4rGFJAKL5P+NZRQFoTlgmjhI
         26VRqIJbL1Yc4GXYsyKyrEFCramB+SE2Xqdb4Mb5DnFZYD0AOC+mvQ38mStjZgymJKpn
         47hvtwu+/1H+eIP2uPLy96Pmx+qp1i79/lOr/plNoFnHwB2glrv8Mx0f1OPXPXhXY3bf
         oF26SWT19r3CWKj+gbeWAOCP1rVdrArn5H0Dj9bx2RX8j7e2ZFQvO3IB9u+/qph0xAqQ
         wztIRyjHgSLgwldvidCZEoeNIjipKVXs8P+Zvrl0HDb5lY+5AumZApJYSrR0iK/CPO2V
         k1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193860; x=1793798660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QSj8rOP+2chmhd4OaxMY8VQerZ+RGTF3X9Nqn35HPWY=;
        b=NnffVCX8uEIg1GDJdb0xjCVIfj7RGSqfG/GhTgvNcjH5OUT74kp2IQM4v6o/WeHoJ3
         gCsFAoHb6sBVIYjxB2/1Ua6VhoCbGEmYDfAc+RJWu33ej0i3FxrBbjpv0KyQL8D9QkcX
         rNtHBkyffXLAgIFzGYZo2ThEl4PaYOSSwjhdNDBJ76rbguUj0Z5LLMUigyxkIQ27+f/h
         l+TmmuhYkFx5nj3yvBFIFd5tpzWp00g4mgwzMkvD+HJcq115w5pSsOMHq3SXCRLY8up+
         Oyt1i2iREKg8UHxp23ra5EbwI+ZI/Xvd6Af4tgw4iGIickUcZ7d9H1Lhbq85G7azwlCD
         rIVA==
X-Forwarded-Encrypted: i=1; AKwUvBz6hBZEwxWXfNs+iR1I0Dh8n4rihAN6iQLss7UKu+o5tGfXQGQOXhzzzmWHyvOp9dp2/wt7W9UHUVYgag==@vger.kernel.org
X-Gm-Message-State: AFq9FYJYEruhOD6BEQnlkuXURtFSkqUG05DOUCz+y9cfpAAldxWKTrR7
	3u/FYiJ5w+CF4kMm761cPNEvuhqNJGnjQ375tR2n4cBB4XshdKtKtvpB6x1Gf46nmoln7j3rIP7
	StSRi66TuPlOpM0mooQfDSQe7ecUPvp11sMWhyL8Vewmxwc9HDIndBLntH3qkCK+/Ig==
X-Gm-Gg: AYBFou24kU3YsH83Rch+91xxa6qaaTdyyLis79k0HXBjhJrxgn7JqkmPtJwFD8+EuSd
	UZskZmT6OF16pMPG2bn5osOlg6kCeYXIIcOK6xJ4a/pNBS+eS93c1GHennOW/By0URmxHP07DCK
	mvzYTwWk2bwAgoWvh6tyXdApG6Bsaqf3h7blqPKF25UXDDbADfd7xzxAJEHXX5fdotGpkNct2+i
	rPDwskbnLmNafsqUHxzN8J2mHAkb7DavzKE/neW35UTjmKD8chTM883FT0JNhWm2Xnsd/UWGurt
	yOHso69lz4Isb7menyDOewH45bc+oxH7yHv3oTijmMUefQVOuz6lYhW0cfCOoFoxrI7oELQ4oXG
	AtGPzRA4Mirgtk5XOK5AOfMgGwbR8+bCkeAUhwfvMfK4jsrtoSRqGuvbz7PoMwknHeutCMYF08w
	==
X-Received: by 2002:a05:620a:2720:b0:93f:26f6:6bab with SMTP id af79cd13be357-94408a80789mr303300485a.18.1793193859909;
        Wed, 28 Oct 2026 06:24:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2720:b0:93f:26f6:6bab with SMTP id af79cd13be357-94408a80789mr303298085a.18.1793193859393;
        Wed, 28 Oct 2026 06:24:19 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:18 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
Date: Wed, 28 Oct 2026 15:24:02 +0200
Message-Id: <20261028132403.3505037-6-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfXx0LDErCQfY/Z
 mDeJc/YVgy84eToJsJE1Eq1EHysgNl3I39Pqpg/aKz2IdF4TxYqOjAVPapAJG05x2/r3Mw5MFRD
 GF3IQe7Uo0Dl7BJlgoGbh2E968YxxjGDYdKR3uZEoDlLVZC78Fi28n5mna9s0yV+lkfz8YaGvdk
 ctCZfFo0oMaXibVvbZYYQjuxa2SXSgQz3vTnkp7bG6483UcybK7n0PBbkCJFw5CG/gT4l1N6H0R
 i6o3ME+sQ5ELXXrnSO1qJNWN1wZP7GCsUA4oPxIjOV23aaY++/WgPSrAdXjM0YhemHiQU9Dzkj6
 VAsZKjD5LYPpoRMsBSwl8wP/W3ZHa3vOsswJB8wdcOvX+Mn6RPY4OevD4DNRWSlh7csWWCCcoEH
 4LmCtEtPgfXqFlzzSR38Sj08gU5wEWNB9L1qn8hbGEJweBykNF343Ip3yMk3byc5mEhBNiUWwS6
 d84CYcHJxbSk4ipzX2Q==
X-Proofpoint-ORIG-GUID: AyJaYJncMocB4eMhpRJWZqMNOh8Do3q7
X-Proofpoint-GUID: AyJaYJncMocB4eMhpRJWZqMNOh8Do3q7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX/xOm1dCRUxDi
 vyyUutKfcU4hDTNze4HG/DGgsbOmnn/VXP1Dw7BznOGY3/zq+HI21OlBNmbZ6Uh5i2WKY1Rx/HV
 vZRG0K/Y5VLBZKLJiSMneeWFo7l5P0E=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1f785 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QxXRlGHHTI4QcL78iLwA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280053

The SM8250 VFE AREG clock lists four rates, 100, 200, 300 and 400 MHz,
in both the VFE and the CSID resources. The VFE only enables it, as
vfe_match_clock_names() does not match the AREG clock name, so its rate
is set by the CSID, which always selects the lowest one.

Match the VFE AREG clock in vfe_match_clock_names(), list a single
400 MHz rate for it and drop its levels from the CSID resources. The
AREG clocks of VFE0 and VFE1 are separate clocks on the fast AHB
source, so a fixed rate keeps one VFE from lowering it under the other.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 +++
 drivers/media/platform/qcom/camss/camss.c     | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 46674bc30e6a..6cc5d4e2aaf2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -907,12 +907,15 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 {
 	char vfe_name[7]; /* vfeXXX\0 */
 	char vfe_lite_name[12]; /* vfe_liteXXX\0 */
+	char vfe_areg_name[12]; /* vfeXXX_areg\0 */
 
 	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
 	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);
+	snprintf(vfe_areg_name, sizeof(vfe_areg_name), "vfe%d_areg", vfe->id);
 
 	return (!strcmp(clock->name, vfe_name) ||
 		!strcmp(clock->name, vfe_lite_name) ||
+		!strcmp(clock->name, vfe_areg_name) ||
 		!strcmp(clock->name, "vfe_lite") ||
 		!strcmp(clock->name, "camnoc_axi") ||
 		!strcmp(clock->name, "camnoc_rt_axi"));
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7fe12049b78a..9e29b713288f 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2053,7 +2053,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
@@ -2070,7 +2070,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
@@ -2128,7 +2128,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 19200000 },
 				{ 0 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
 				{ 0 },
 				{ 0 } },
@@ -2154,7 +2154,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 19200000 },
 				{ 0 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
 				{ 0 },
 				{ 0 } },
-- 
2.34.1

