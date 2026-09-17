Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1A43D6484
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646787; cv=none; b=RjXrFljFMpvoA9P3wIxkwFuFBEB24mGkjCRpXkySVKei4Xt7BunyG/Z4c7y+ydt8ZFJHrorlqt4F8WR0g2ZnTT+rjCe1DFx1HdWqLR6l8RtN6xo8Bc9xCaExmmV+5o5WMp4E+V5L+Al7ib6xikge6o/bilB5/SFHoeHgTV6fINc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646787; c=relaxed/simple;
	bh=dRIORkLtErUy8tQv0r5xQE2yHwcn16W9lhrS1ITHzeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVxTG4C8vCx1tuRHeB8Oz1DuvQz2ZwKhjl43thhHLa7TPu7SNrvPLHQCiHfyGkw0So8fv109za2VJ/ncmj8bkdY4qhbJR80FRfsS+UgdFZymLkBtvxDJmODfHGBQmprYLfgQPHGKcFtJ2JilhUNgOEqZuLTcZEm5WyoSH2gu9OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7Uwg5eF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FzKI5Em3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7Uwg5eF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FzKI5Em3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zauv1149965
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 12:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=; b=U7Uwg5eFG/pmFsnM
	xjn7dPDCxwjwcnMVZJ9pEha6boZUgOzeEhD0h0Jw+xbO+nHih2NI6K+0bwLOoREq
	AoIzbhQHSD+uRSNkJga4b3wv71i5fHxey2c2sr1/nF4Wh0KSFK1omFIkTI3FurZn
	oUsA2iw08xh80L1FV8YVvQ2azYF88oexBO6K9l/yZjBb90O0+7uLGGm5PJlswt5C
	LXxD5ghUGbpYy7NvyK5KAXltBWQVND9V7GdPiWfH6O/aohR69wQKIjkXsYLtMcYq
	iBkUKHrH5QXfU9M2+29tgnp2r5mAQsaVkAy+ozJr8NOxqI3sWsI72Vle4eTrOl6l
	iqCjdg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grc9w8y1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 12:06:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso1450599a91.2
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 05:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646775; x=1790251575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=;
        b=FzKI5Em3ACbwlrSdfVBaBTqlCqdkwiOMpUVgiB45BUavS6wq1BaO8+jLg3tUsP7XjR
         Kxy3htgA8A7jGXsoYO8hl3+SkaKbLUC3Ok/no0JeyklQB6fCH3Too2zbx40Kudb+9F7P
         IzE1ZUQwpBvw7c4ER6+/RkoGSCMjM4MCwU93Kyw7vVk0SsqaWrJdOoaxXvbzsDBLE9C0
         Bj43miPut5uu51hbGofNg95102P68ItoOTw+l/6sgejYwaxN+7NWzlwo6X7E8OsLVgQ4
         H4WUqn2VgUmN8X3D6QyWXNaNc8Ye+0TMOD3CNQgbTG7+HgRxvKSz22bjTYHPMLIyQUEc
         NM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646775; x=1790251575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=;
        b=hEephr8oBEKyQpWwrJ3vyXwHQthzRcpGmInDdRBmIIOtP5Imwojk00JSMjeNNfLpVK
         jmEOM03vyxFKDXLcvjQkbFBggKWDppQpFP742lJKG9ciate0mkI5403QlOgDAq6YrdKa
         pNimK93Y0CsFQJOx+DC5hb7v5h31DYOHCOXKT7WrX4GPm9dRBakdcfltclU/PlKcoUGn
         COV7b/whAGyb+H4k2tcir3W3mjKHqzsQCClYW1B9F3oY3RrZzWXoN/1kQE9b0al2WfJj
         lDH3pSvgHaaWi2pog7ZVu51vUGoDFB2E5UYaqP98zLLUcFAjNBO7l83tdwWY+d05l51s
         Yasw==
X-Forwarded-Encrypted: i=1; AKwUvByjMJ2/9jP7bfK38FVqp9fE2Ygdc+QmBYJ0e4VRmfdmjg6pwVfPszcmcMkYWuCpaswRs6tCizz6t66sgw==@vger.kernel.org
X-Gm-Message-State: AFuF++m/mlnl6Ki+CSUO9PZQoet2SAPJt3eJsxvrhz0GKLAw21a3S1H0
	UXivMKerShjszt87xiVEbcI/Tc7w6rnTgLhlEOG3J1UQNOleNQoF8yycAVCAyhHJdB+6iRqxVCV
	qntbumQ8JDAUFtc9f0wU1LEKZr87uh0euzQvpfBUGbo3MuMnqEdyk9SZfEGqhVCA+CA==
X-Gm-Gg: AYBFou1I4/QmLFrhOhjqzIiMeJAa2VuSVBFDFSr1+siStmfqRlMjpZ8hjFkHIERam1A
	nuqqPVELpMreJHjrLkKT5Mzq2cCGxGNSYt1+9sBGS/UabHhDlbsFjUtlU5JH8it98ytntQPDHSk
	bdmP0wRpJFxg7dLRBsQ5d2hOwx98JDMo9Fdf2IeONtw/t4emj3oNJcMvO6RFMe2hi8736JMasjU
	ShA3UV0am2a04y3wDU49f8hGQyL9gugwgEQfcDPeI7KFXNHZakKBi92TQIew5Vb7TNkB+Ga8pg+
	n8NB92vycx7GUCBFglPPBIriF9jkPgqKaU4MuvdpQnvwTzOP9MgR6OYOG2bo9fYJw72oz1CSBJy
	+sD6FE1YMRfRdo4ve+vPzIlE5rq+TGA==
X-Received: by 2002:a17:90b:4e88:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39e1e30ba45mr15795507a91.11.1789646774862;
        Thu, 17 Sep 2026 05:06:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4e88:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39e1e30ba45mr15795404a91.11.1789646774273;
        Thu, 17 Sep 2026 05:06:14 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35d9869csm5007612a91.4.2026.09.17.05.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:06:13 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:35:43 +0530
Subject: [PATCH v3 3/3] media: qcom: camss: Add Glymur compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-glymur_camss-v3-3-1d0e2d47ad2e@oss.qualcomm.com>
References: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
In-Reply-To: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646750; l=1214;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dRIORkLtErUy8tQv0r5xQE2yHwcn16W9lhrS1ITHzeE=;
 b=nxyrFl9h4+kkxs5v1Hz/1ajWuTIr1Gc8gWV7jz5BGt7loaxka1cQ5RhKwkSGqRpfQ/S++FVgB
 BxTRaBQ3SFkAdZaZdLczev5MWeJ67nyhFZkOh7hCbvax5qVUeDTvpig
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfXyGAoszM4HcYC
 bGTqpNjuh5NwuD/O2OlTqCtHYp1jHny11pLAWibnYfB6oj7sIfcQOlNYjSBLcBhzrrm315C9ISX
 LhVx+CcICYRVHwVGBaieU90bTg+z65IHOqXDQLhRa5HgACVInRKU5JyVVT2Fi36uvD2fEEua8BV
 /VGKQuRngxb7eYJfZQj04jzpj0/WYECPQxRYY1LR4c/EaVxfYBhEbo5HBKmOtlOy+RBh+JnEWyQ
 afU/Cct4zyEqXYoSlVnNKoSpEP5MAC3EY5Uaac2WU1PdGbCOUdYGe2HxAUDV9eVMD01vqr/y3Cn
 MTFwabxa/GVaVuEdzbTDB73Ln2brfahVJqfs2vGL31LgjEft5DC47+GBemUtEOsLwFsvvTdCuuc
 LZAMNW3w10tnuEhfGy4bS8B0GL0Mc8bNN1UaetEMyu9l5vD9p5C7WEm5ZFO6cGcjU0YhNtT7/UQ
 n57A3AOlv+wPcTTmBgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX/lPVFPLiBTiB
 4RSHRt9Z3w3YvZ9vhP863dEpONXPi7Rmqa8IdwldBr1DXzBxAqOWcBoKiaGrMrY6P8soaZrggv8
 N+fuzKTfIcZORdKssG3xWbQgY36vmmg=
X-Proofpoint-GUID: uqP9kAwDhq0S6DbtuLfz6Ocshho9vwK0
X-Proofpoint-ORIG-GUID: uqP9kAwDhq0S6DbtuLfz6Ocshho9vwK0
X-Authority-Analysis: v=2.4 cv=EsZHPicA c=1 sm=1 tr=0 ts=6aabd7b7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xYyVevvQUQiUFKtwU9sA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170169

Glymur's camera subsystem hardware is a functional subset of X1E80100.
TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
three CSIPHY instances versus X1E80100's four.

qcom,x1e80100-camss is not used as a fallback compatible since it is
already claimed by its own binding schema, causing a duplicate
compatible warning in the DT schema checker.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..3585c63c45848793696fbdc3004ddc867a5f115c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5758,6 +5758,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1

