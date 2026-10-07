Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC73490C1D
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363803; cv=none; b=jxA/h4nJAnBvxEQeWQNtuWXvSbZdiF9TpC5G03MfliX4+b16S4ftEFZz9KHFUGn0NZbGTgUEB4LidkgEW3SSGe8Pwca3gigVVi6kb1hI6Kh26mzLe3aoGNDAZVNZLzurlCRpSym6yiLiDzkBOBrltal6d7IpKo8TMdMB+foNlx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363803; c=relaxed/simple;
	bh=o5oMWdlrxTsRlmHOBCOZYGSUWpstGq1VRL0Ihw6vWro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LJi/RRshn8lLw2yi7443u8HamDgcnOHyhAmsERKtVw7jqWbjAiSQbPrGCloolFsr/+6tjC1T6iW0aEy4yvkV5fpZUKjbyktSrzQAri3nvHwWguDSmVhLL16kCLfqrhuk7KPbdd85ievUG2n0mQc3577jLyHncyWPUBpuuB/n8xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFkMoETG reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFkMoETG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jRjE118860
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vf6YFVaTEQg
	R6onACOGmwSOqqweT/zzISJg73uugZWI=; b=AFkMoETGrPBVySR23V2yQ7qaOuG
	l2QSMgqKauKCzk64DgQaA3YhRyZo3DfJB+VktD5EX5BKP57szF6kfCGbbUyFCkYk
	78h5PDV6Op4/qQCH1JJOoytZOrOs9HlpZltAc+POU160VAE883d+JxLWHNaP2RlE
	uyH+/9kDYD/l9GkUpCLimzV788/Vmnr3xAeWZA2a0Y4vJJN1J86fRf2eCz6KN+aQ
	uPdbL7owxVeEJFtLi6llxRKl2SYigIH+5pjXw2z0JV0WFH/xVoGP1PREHhzmLNNo
	HP8GIyU8RTFALGsK2WHErd4fooNyLSPElLsIqZ2fXvQns1UqU0d7ySkjLLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc58r8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:02:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bfb2da664so895333385a.1
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363767; x=1791968567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vf6YFVaTEQgR6onACOGmwSOqqweT/zzISJg73uugZWI=;
        b=zgunT/f9NAaAwANVsh1ZG1KnY8AFPhQSPvr5Rv+wqoJKA9Yffx84STM2V7BbNe48II
         iMvqtSYeedvGsn5qApaEP1fOgQrQMYKGyKJ+Yx37V+csqVa0Cx3zRQSnSfl8HL2wjlM6
         BsjI+nk9Xum3vVh8abLDktJ5CEpNt3LgZRJ2u8TFdBT2BzPuZukOyr5jhxfFpngAtahi
         bMqvHh8yEFIabEZT57ZBZKEy0dFjyBswo38ooeH4Kf07QxxCE+6GXlevAlb20YErSWsJ
         /JU2MfAkfoWomKAPSl9rusf7Y+5XUn7kW37JAdisxTZx0d4fwDbmJalAdg0f+YmKos0m
         JxTA==
X-Forwarded-Encrypted: i=1; AKwUvByA8FKQsuQb8IzeqD8yBflQvKCc78p4/iRIjKue55Y/lSsaiiwLCVV7ZIiYCWinl/PjtgPQC+Vlh5fPug==@vger.kernel.org
X-Gm-Message-State: AFuF++kx/VHZeavVm+sc3poFryZ+7BzFhRm8y3tfzjWoUf3sMJqsjVLc
	MV9T6lRLTTV/eguyJyM4MM11ZjfyJee9UP5CLAJuutX5Rzn7eSpaXckJXLO7PpT2JmIjIDMsQod
	T/R0Pftwrov2iPzxkYiDtWSTU1/l1pmTcz4KyugHskHBoMf2usljFnv38rKtILgwRMQ==
X-Gm-Gg: AYBFou0Wo6QZXW5mG8c79Jzdm4ofTNAcA7KqygtamWu5FRSluhe/sEpmP0oNnX/CBke
	RsNeZEzwOCC49jU960AR9eSWvE2EskSp6X8Ht22aRtqUt6u/mpKE2jCboqIwvWz8mcD7/35ZCmH
	VOQmtp+BP5Cx92Vsr6ggjFHsEGUJR45vCYNKgNJo8KAvaV3GYpvCXGkImPYuW+Hlg1mFAFfq7cC
	u/KRCL+tf/PMOuVHGPDGwRZB5InuHYmQGA4RFd89mMgzQSmRDajrvADIPzgwzRqmpd0Wji3pLtX
	JzOl0Z3UGoanYHSLzNjvhtfbt3cZzRIpFcaVflVHjjQySeaR9pF/MxMhIXw=
X-Received: by 2002:a05:620a:17a3:b0:93e:646c:9133 with SMTP id af79cd13be357-93e9b7f7793mr303006085a.64.1791363767565;
        Wed, 07 Oct 2026 02:02:47 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93e:646c:9133 with SMTP id af79cd13be357-93e9b7f7793mr303000385a.64.1791363766962;
        Wed, 07 Oct 2026 02:02:46 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:46 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 35/45] arm64: dts: qcom: use SA8775P IFE resources
Date: Wed,  7 Oct 2026 12:00:31 +0300
Message-Id: <20261007090041.3732717-36-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX1oPjVdNQz8Yz
 lET/7RxOOCMerX44opbEGBsIGRK6TpCyW3ruxmNVe09MZcFSM4uA+CCALfIMyOTza7kBmYZA7dh
 /DkDDHK9x25fKDUQXtyNlZewkhPXjdY=
X-Proofpoint-GUID: Vt-qAsmPVAvlB1IcVj7Ul80P80yJTKsz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX006jRVuWBHii
 /gidunz+Tj4tFapxLpynZzpDqSIV5nE7ZIAsjCFrMI6GVGVfVPZWT+Aw3ZlRQ5lG5B1FF1toRvB
 B02MlkJFV+q7Ue5URAcbAk1A3ttaPWBYnEBnRKkK7JwVQqG/nrsIx0CqcIu7U1JtGt8m90Fsx+e
 jVhgCRe7tmXyoBJ6/GYCpm22YahGP25+PUlXVcxxvJPE2f15h7WhhIhzrc7P14PM+5kWbsL4rN5
 MmLnIQscWbVbUQ/Fku7+OIwb0GJbbEgzn1lRxCX9RjXxTKYRV8FeIpk8xnKat7kgTCbqJNYibWW
 Dbe1JQEcZBvP4HvPinWgsJHv9LBt83OsEoNXRoH4BMoZWwempSpB9pYxc/2/E+ffW0jW1oV6tyv
 MZH5cBb1D3O2MVJWT3YpiHwhCpQD1V/PmdHBOu5D8YZudgP3XmR0MmSWGm5ZrftSjPapOOy8a/p
 oAWOX8aEi1eB4x/sDaA==
X-Proofpoint-ORIG-GUID: Vt-qAsmPVAvlB1IcVj7Ul80P80yJTKsz
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac60ab8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=-SsTkY4pZgJ_H_-AmIoA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Select the local SA8775P CAMSS pixel-path compatible for hardware
validation. This commit is not part of the upstream series.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..59be841b89ec 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5167,7 +5167,7 @@ cci3_i2c1: i2c-bus@1 {
 		};
 
 		camss: isp@ac78000 {
-			compatible = "qcom,sa8775p-camss";
+			compatible = "qcom,sa8775p-camss-pix";
 
 			reg = <0x0 0xac78000 0x0 0x1000>,
 			      <0x0 0xac7a000 0x0 0x0f00>,
-- 
2.34.1

