Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021862;
	b=ezvGy9odICyeEpm07yUQzYQnNhQ01eWA4R1/8LzsClv56rsXaCwjAxJfKS3NwCVVooTp
	 gPmNdijox9lFrqeRJFcAmHPKZbZle4R0royl1B5Bvg1cIS0iDcXlGHH+q3eHPhSshF8hS
	 KoKAW06sV+dXpiWD9mFrwS2dwn5JHhhcJKQXyaFwA+OTqxFloCwVolLATZsTYGIFZdMQ9
	 WDt70cUNzfMi5DEDt6i3hgcFW5+V9zjkfZDHMNS6newGuL2m62b0YaBQGprEIrcq+m36Z
	 D+ySKt+rjwvpBdNvqjhcEOFUtg268luegkz64uCpFv5qzTVBMO2qczZtLHxJy++jmFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RuRFymShgsilHwdTJCHghvu8/w7kYi6eDSMaIMLmBKI=;
	b=LqPkBL6+1LvQj/WRy5owE9JG/GXQjm3Y6Y5gQFHQEoKbKBucrVQR00lEcd4lgbHQjU1/
	 16m1mQ8tZtXTqSIeZf7JtWs3g1P2bbARoEfBcfY1+FwKrkd5ze5wof705aPD7JE3lR3bs
	 CXelBkoZfFafppf/XJAvqtI6XNyoI1tWrdMlgIpPIOyyCoJgFNifY+Immn2eLkPjhCfdz
	 RBUvHY1+6JVMfXGv2WixgIcYhqB5lfzjZkqHCLfKwV3FkFq3MDM30j6ozF2hnBcFf0arL
	 nKjYQnj+wGX09ThrQ7hGsmUq1DEC/nonPby74nJCUHpS+QQARt8p/Zv3yBllwJ/5p4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cBb+Js1J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uq5BcEw2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3106072CC9
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E3106072CC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cBb+Js1J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uq5BcEw2
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt8Io4126455
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RuRFymShgsi
	lHwdTJCHghvu8/w7kYi6eDSMaIMLmBKI=; b=cBb+Js1Jgge4rwa4NlyBBYDN+I8
	3hfWHZe3O2TgATdMd/pJfZLA1UmEPDgdjAz3slyXXnK0jMu9SM9lNpnN1xDC1oOm
	rUoCKjBykCiOF5T2RnX16yQWjQ4jk4TG/mZtpozeHt+o7zqxUyY6t6Ig0MbUCqKM
	4qmmc9c88rCWcjSGYdbn4VgkTjpzxLmyNpUS+8W8g5JnbHWs/KdGehkR+MgYEWdB
	WI9tdK32Uw9VQq1hl2w2+zTDv4n8WNQy153L46qO47bVpHARDzscPFrWn2c5NIzQ
	I+idRdcPp5A5Fkx1gp5ief3FV40bNoGCNB0YIaOLL+xP5LejWq0T/jIgT5g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshptm79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5337f26ee19so54434171cf.2
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021861; x=1793626661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RuRFymShgsilHwdTJCHghvu8/w7kYi6eDSMaIMLmBKI=;
        b=Uq5BcEw2rdrYvjKRHHdBvR7cj7rPh9PM1HQgSGGX2Qk9anwQ2mmabb4W1QrbkFwwaV
         No3e5+dI5ysq0L2ylk9/BXFypaK3D9R7p8sO49wuGV2RMfuC9W1tRJTf7kBn5UUavug8
         6aWNKnggoP5y8Vih4tG+803u90mV8Gghg/LwdX8XTgIiihx19pquB0kwQb+liIi1nUCN
         c/hlt8IJKsom7dNb/F1UgrET+p4tUh58KwJzZ+izVeFDUvM4ZufSigB3tamlJfdZhG6c
         tbSOpuAHCYAfvzjJpvCLYUf/8/26+8vxGMHuCZ2RbGpbZ7AB3AfFMOaYcKa3Uuet7MyC
         gYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021861; x=1793626661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RuRFymShgsilHwdTJCHghvu8/w7kYi6eDSMaIMLmBKI=;
        b=TIFR61GTSfY8SC2QGGdH4DB7/h9vm6XbAXgTYMzKf63ta+E1bhCRhJCbYARuM52y9n
         6Wx2MG0XJ9wUbFlzh3mgfMr2OYPxYpJb7sE0eV45L6QBqDcQVd92VutexG1jCGX33dhC
         NL7DJEafa9obETYiWQ7bAXMUzpzSq1fddF92fZFx7fyiES+aFAOx7P+DyuNXqoUdcfOR
         awdnLgCn9XW7VlTzk0wRsWePi/XAscBC7+hGsBn0vMI1J8BasKcdT8MxEvrAArnHayFj
         7eFgIdmv8FZv3xXPV67XD5t/98QM9tDZ12GTXIXp1BOgUPwrd+xdD29ewGvwEuF8IpPJ
         Gn+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzNLDerIlh0iJRrUVnjQP3OTIWlsod1g/PqnlF0l9vm36ZG3+34srz/ST3lxY20jeITFKR94+e8f3WZ8g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLmuKlEU1VUW4YWhw/pe6o4bBHijyX7T9NThQPMQP6rOC3qEx6N
	I4A4262O3/Vh1ZkZQtVfUX2WwUpN6mtODDHTuf3WZu1IXL70OkPxVeKnmF9LIVtVvWfcFytw+sQ
	4LfvH/eDodeC+z5DrCBGUFyjqjYfM/l1xqB/ZnU8h3FIPD35W7NlGwTJCdIGgp9fNAA==
X-Gm-Gg: AYBFou1oFRTfs+xbmmwB+GtFyIqIKZOhP0c8T6oD07+I1qK5AGwioUlzrXJuMMbeMND
	s7lM8Cd5uLrFfFmnp/q7iQ1HXeG/iUW18vSH1jyxe1ioi46H8rnvHaERQuAgVmLjIBqEIGs2FYa
	kCtecPTCtodDOTPJCu/YkhkJTrW2/7s2tkd9QbS8rMtE8Hr8F+rAXNneVok7EafH5sQXF3PSezs
	DdU7FJmqVdRtrSmT4dZmj7g1tljDRahZraUBvYQ5dLk78ry1gMcIwR4QqoBDX/NtP372WwX2soh
	9RSZ8ydqWC9PBOjqq0sMCN6X+jKwqaLK/MnHZmrOIysqQz5LFMUSdJx2ATl71aVFc9TNU+skzNO
	DfsiHucSTzj8mdSLswGIfUFNF
X-Received: by 2002:a05:620a:46a4:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-940ef8c944cmr1071687085a.34.1793021860735;
        Mon, 26 Oct 2026 06:37:40 -0700 (PDT)
X-Received: by 2002:a05:620a:46a4:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-940ef8c944cmr1071681385a.34.1793021860265;
        Mon, 26 Oct 2026 06:37:40 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm15376512f8f.3.2026.10.26.06.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:39 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
Date: Mon, 26 Oct 2026 15:37:25 +0200
Message-Id: <20261026133726.3249235-6-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfXwe0ILLWZZiEa
 6SY4AC7r+rHCPtPs1Rymj+/qASSojA1pGm+6sbIt0ui0o3aUHNy/LZ363fu3lfQvAEE9cM3Gypm
 bvIXQiTaeAC92R6tvedSiOdzwzDTUFM=
X-Proofpoint-GUID: 3iZv84ejgjJPpSMC_6rPwIOdb9i3zhAf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX9RJYak4nGaIh
 ozsLeowuavgMZ8PcND6ZYWoYWTx62Mj3noCqMUgZdzSC2fRS3jMDQYXklKLYTqK5XU9RwYYIcyX
 tulG5DJAt9Uko4j+1DShinJSmFDSPMGgQgyy1Hv++OF0MRCAJ7uJLkBSF9W4f3gK5UNwnT+bgar
 wTHTM2RJjbJCdHb/BomEEZgWwU0E3YtNDPnriE7y20J5RnngU40oCiXC9+7F86ElzXbPRN3BJod
 JMMmJXqaI+TOh0qdS3T/bGFPrOWMoiH+ksEVda5ASYTbZBxXFW+tj90nxmgvXti80e1fc5h1F2Z
 znlXMJH11EA2ZH6sgTAeqXnyqVW7RDgVlq03rOxtzo1R5cq70OtJ0gIj7q3dJwINzLqMCqjiXWl
 gf42RuukHfb75sLBb9qRDQSC2busADIj61A0dMYwz5/ok4mZxQSlP5YhJTGD6Wa4+QSg1+b2xKN
 gwHoDzEcwsVQ5bleiKA==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf57a5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QxXRlGHHTI4QcL78iLwA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 3iZv84ejgjJPpSMC_6rPwIOdb9i3zhAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260054

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
index 30504e614e4b..d38491a845d8 100644
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
index 80eab898611d..911ceb7202ab 100644
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

