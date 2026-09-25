Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3E543BDBE
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 05:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315363; cv=none; b=VK74FVlIIU0ZJejEt7XLPhqDLSZRap7dffyqCQuLKhtPKNXLkWXk7/AXbximu9wV1sjNjwdujj6hy7GHXOhQxKnPMQQUnFZg35m+16nP/ohru+oadXzRygkYY+h6pkINu9UhjjL03nGRrOV6R+s65HF6KdSBPVqSvYuYEZt3ntU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315363; c=relaxed/simple;
	bh=QLwU7fKegSZgo7lckFiKBtN1ZL2aPp2XYB5oMQOrME8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iuy9+M5/hbQT8po6HO2Cq+d8akE0ROCxR0Y085IEtEz2mggCM1eDc6ksTc92nJuobGmYaQUy1CxnmfaX2LN9dwpcrtceYD43lNvY8kpwo9pUHKbETlKSGOTQf/cPfpVyIj6v+PhntA2qC1e/JWiIgD8SiQPXAoxZ3yX6wM2Cuqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGTfyAbE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gC7eu1Mj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGTfyAbE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gC7eu1Mj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JEeS3627541
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 05:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oss9++ljyuGbbaBIi8aA3J+tr+vbQN/DpaXOHs8TZi8=; b=eGTfyAbELFWnKAfB
	xt+GAruKXEPtJTQFZX/PIVtmQgtWvq3H3twCVe7TRXsKkZ7OEssHRWR7Fpr0454B
	OCpfsfIF8WS+HXgHanD+P/V+sQYlZlv2lft7d3kloC9jV8koQJTTKLmMFunDm+ur
	ehLDFd8YdAq7FSjJ3KuCUK4GyfNBySPaJhJPYEv7ewuu6d4anJqKPnlbuZgZC1lW
	AnLoj75lg9KwkmzSUtvYjzsc5r8mez0NsaJkwy2Ab6DiEUNCUWaAt09avcXUMyaN
	ihJX/yNEFryAZd6+FPipPbkKOt/PsxfmyAWwHjXZkhThGePcRz82UBXJJRUscZk7
	HAbx1w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq382pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 05:49:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3284bbaa89dso2098406eec.0
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 22:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790315359; x=1790920159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oss9++ljyuGbbaBIi8aA3J+tr+vbQN/DpaXOHs8TZi8=;
        b=gC7eu1Mjw149zKF8u5DALqP0RuZCgOyonugIeX+CsIvSCodV8drv4wdks07CBXzm4g
         6qKmTDnHsve4gNpDKDvmE0fVqhgHdOS4aGwXg2NspU9cXOdu57keDjkBvEGJ+s0Ma8LG
         4i1HsKvMjwEQlHqsDaZXB6NKEo2UkmMj+8QvTFn82GRNcV6OZjKEcFV8SMgYwHA9AjrS
         wXA8tSVRKgWXC2KLC+6BrZM05NLsbaukQu62xjjN6Zoqm+UkcIHrsOlWuJNEqHLE6dys
         FOau1P5OVs7QYn2d5w6J6cZ+47+BkD0ALuWwGL/UymfHYOZc5hBhpT4MmttzoWbAHCsW
         ZQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315359; x=1790920159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oss9++ljyuGbbaBIi8aA3J+tr+vbQN/DpaXOHs8TZi8=;
        b=OBYcQXDnvKj7wIPt2JZrQ02wBEOANhz2e/fPTfCQExHQPuhp6ejtqdVvzqX5MALeGU
         d/S4dzpqzZkbVcudrCTCo+Yxvaouk4baz/qk1+y/zyM660y4Mz99LPqd6Q0dGyv8tXdx
         uFWhrBPuMGLG7/OYkSIMfRoAKJW+nH/wjYGLPZp+Ox0qFyK+JG8BLpcSJmUDmtzxyUP4
         zmnVsjlHhkCpx4+APTK+dgQrC0/mLv6tLoYa5q59f9bhIBwrMi8sezFnvwSozW/kqfna
         b39eswitOGDAkO1ZmsR3+RhhP2ZUrQMBAgpASBhYUD1wYhLbA3O04SjJJ/PE0OrE5QX6
         gX0g==
X-Forwarded-Encrypted: i=1; AKwUvBzhv2Me9OI9aS7QGXXMQ1EKWfH0dWfU3+Xx+R/pjlrG4W7OpWIzP+mTyDbtEVyTIiaRyTftHynnVJ8u7g==@vger.kernel.org
X-Gm-Message-State: AFuF++nBneZXd82dR56mFAt5B+uESBUJqTfhevpfJFNox30FfWJls3gq
	pemqi2djLoXwUFUaeTt3PyWeJG8oACXUj0hO7RDPnovpxmxBzXp/IobOHMO4OYrvq1nJpfkz+H/
	ICzzjtLf4Q5rUgPpCgbqE1Nyjj0YZuXCAKm7yAfoiJoPKZlN+rUAAhaMQmb6B9Q+YLA==
X-Gm-Gg: AYBFou09leFhWs9fu8BxZSjUcx8/GVxaeapxekHQ9bYwN3Cfjy3uJayMu1KthVOYy5F
	np/lEWvkfNLb0HDHZKmGPuDG6V8tUSMaFTYyojrxDbE1JReRJOTMl7mR2BtaBjjbHP3oDwgOpSj
	u8/hczVnEhL8qFFE/ccw2wH55ufPlRoB02WclHqJZ9XXld8hVqjs7MwsBoYkOx0g5xxqe6bTlLu
	ownQHvzgRZR2juNLUeYCUC57drxVEUdlNQrY3mnkgY2NqkshNdEDUsuQSAa+9RcwpEEOmwy3yn4
	hvS9P96wWRNfY/5S8unsdij54b58eLZtdu+49o4TTO2+06M2r4iLeGcSeuA/j/l2tB255W0koi0
	OXgUbXtcrzgx11zAwpa0hkkZCBIZWQXY=
X-Received: by 2002:a05:7300:8427:b0:334:2f5c:7c71 with SMTP id 5a478bee46e88-34003ea90bdmr4212614eec.33.1790315359149;
        Thu, 24 Sep 2026 22:49:19 -0700 (PDT)
X-Received: by 2002:a05:7300:8427:b0:334:2f5c:7c71 with SMTP id 5a478bee46e88-34003ea90bdmr4212565eec.33.1790315358318;
        Thu, 24 Sep 2026 22:49:18 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757747sm4033640eec.13.2026.09.24.22.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:49:18 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:18:47 +0530
Subject: [PATCH v4 3/3] media: qcom: camss: Add Glymur compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
In-Reply-To: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790315331; l=1214;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=QLwU7fKegSZgo7lckFiKBtN1ZL2aPp2XYB5oMQOrME8=;
 b=GmEpPaANJX5Rbq9h6qVoKL1Y9Z5DqvP0yTw3ry0S3pNLIgkkBoGmp1DvnWKweEA8hq9eRoF4i
 MGN5D6ID16RAFcN7R0Nuax6bTwsuplBO+rOdSFi/QbrQDiRqc+R6FbV
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyMyBTYWx0ZWRfXxIldhV9CX8zP
 wGkmO3Cjgvc3cAlo9yHUG+SbRP+sulu1gQFxsXmTYi4PLEXzO9AuYrYM7z9c1fbfo/ABPkYGgD7
 E3bDA6C2mlkIVw26Rjh7h2rLeFFAhk4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyMyBTYWx0ZWRfX3LtJvfd9Nxks
 5QfMd4cZgkoTmS6JRYlybxvnWqA2qblWol2/utGZ1sXn6Cc6JdGlJes3ry1tijxuhRKFGa71hQq
 Ehy1xS2gVZFUPC+/Lgcb7leXNgrmD010szd/Ce4LslsLkqpyWaQbP9WlD8wKs69OMsPWMX4Q2jZ
 8+HGdbbai2ixQBAUXXGa3eLElkfPTbYz41QkzuzduiRAytzLQY7WDuovPGWyeWihRVHK8QA+ZI8
 LaoKaYSi+/HqsxVc4Giz/V+R1eUnSaUcRPrPCx3aTlHHp4rKIDq1hZK4iml3sv7+lyrNRhT7Nt9
 Y2E+DilbtbxeeOiz6UtwQTHKtgokI9v8RJPVIpfoVPnPPpeHftljiIj3bYWA0P29Fmld9lUlykb
 rYjpy4svcFi7E7j2Nlb7dDOLUsVY/SSB24PjO3sJFqOOKEFRm0RHKtsq2rhZJ6+ctmqH/HjcTNN
 YW2Gec2Xa6N3E0WXyPg==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab60b60 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xYyVevvQUQiUFKtwU9sA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: xsGuF1mi9SaXKCqmGQcRR7uzhf9zk4PA
X-Proofpoint-ORIG-GUID: xsGuF1mi9SaXKCqmGQcRR7uzhf9zk4PA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250023

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
index 23f3cc30a15a5e098162bea98ba69fa636abdefb..9954a99981004590d34c722337bb6510fe759699 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5751,6 +5751,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1

