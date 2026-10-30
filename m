Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391601;
	b=fgN6TtEVBof2YdBy4UDozfNHbSVOd/j3oPIyLKa/56ot/X3UiOaQhA09rnmJjDioh1ZZ
	 2JlwBs7VkPvscNG8hKLNDPTNTX7RaCXBYvabD/hMi+IoeHIHO6nEqjukTdNn1ytLovuy9
	 UAVFLpVIaetu7vny0M95fMREB8rafiDwHvap+C6NYhuIQ5ZDYuOzJW29rJFLXRcu58KQK
	 8FHpLArn8ZgtYHQvJWqMEhk9NSxW2T9EIpaa3SaR/sNtrklGqvf5OWAkClkGBdLPymjnn
	 wQMMW14sTin5TgAq+k6+BJq5zWvCU2KypHkBagnH2WJpuzpw1JTKDEJ9835Qt8St9Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391601;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0ro4w2I12dfEEJweknOcVbqt7J3mhia59vFYHx7Lnrg=;
	b=mhNNuIRouByttp7hRFnW+lDZn+lEjoP8xcRQK8RqWWv4TF83zqeJWnEyw9canj9vVYjB
	 uixMBbxKY8ki8MIo8q44vcSMDir64QX0xcN258YUCjmbYM3va+QkVS+RuY65/64yQV9Ud
	 qzCYHwp/NYp+bpdMvocKjworH3xc6kMz6fXsQXNSTPHJICijE23BgBru8yh6fJEZq4Kt1
	 QC/ORbmoMjN+aY1nDP2yeUK5D+f1w4HG6GHD9Nfn/Aw+KX75oBjqdhPa+XNQsl4jyIHg6
	 q9J4bw6T4DmhMV6CGXwtSh9VHehUtmvzlofCl7QUGudunXHz6/2SGA3fdnnu/9KjeYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XEHnNNLi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffG+Qajb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2581606A325
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 20:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2581606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XEHnNNLi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffG+Qajb
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIheCE4084366
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 20:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ro4w2I12dfEEJweknOcVbqt7J3mhia59vFYHx7Lnrg=; b=XEHnNNLiribYBojf
	rMyutTB8EFM96PKO2WMpzEMS96jggqPIRgn9nTNXJy/NlRYToVSMI9374QFm3Nhk
	lZ22b7cDlXiKWsi9v/KjMv6Hb+4t/uT+B+jdlWiaNY0vERznA7pdvNZkTe9McR1e
	cJvLIGR0PTE4o4HUjzbSPVWzZ6F+u8w/NAL5EX0DJ6VgXDpuLiNOHWC60PbsUOYz
	lB47WItYAKpJGJq/tykKrTqqRUWxdfBNUQiJv6ix/81OdmivwzAqm8SHaUiO7XOb
	MsiCLi1MOWnxKdxWTy7EnAOAG+x1xvkeODr86la2YQOOGgPmJgOoUP4gHIkq6ZhC
	nBpEnw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0s608qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 20:20:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so4470746eec.1
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 13:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793391599; x=1793996399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ro4w2I12dfEEJweknOcVbqt7J3mhia59vFYHx7Lnrg=;
        b=ffG+QajbvDDawrR7GcXGZ9KAaNvFa6bkKwzbxQQ5k24ktEY9RjRsdZfALIHpdz9iWy
         XCAx1GqChn7ZrGhcxpRNTYMjkP6Fb7+FekqtQQJMk3AFhNI0cBIknyNhaLqXuxopHJRi
         +tgy9kvr0krLeZ4W7SNQ+jDpjzgu14q2rjSU1JgBpTV6e5I4SwU51nB9+mcnF5hfQa9i
         ezwhYGKaegUqQk4VzvRCgeT7Kgrtt1nJCWLx5VjiOMc+VI81MBKsthck+dP6vi5/dAdm
         Y3F2nCde6bAvinRkXSyIsFx+moJ3eXu6oytS50Hz0dhA95qahMVzXpFJ9/m8fBcT2OTO
         sT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793391599; x=1793996399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ro4w2I12dfEEJweknOcVbqt7J3mhia59vFYHx7Lnrg=;
        b=TQqRJjvov7O34oEdvpJA/t2HIe923iGX2u7o3i+Pz8WDdQM9/B7uIAamqia0FMGDEr
         sSY8HB7pfIfJo8oe4sYpqJ5LOewJNdG/sZUEipray18dE9fPFPtLpZ9peYFyhTzl/5Tn
         ZAS3NQGjZDh6dTnJxlVhZGDNWZa6K3rlqBHxrBLHrcq9neK01Twr+HSU7jRYjcZakLpJ
         2OPPgPhB3pJr45z0CFwvnGd0IlyC7tg1jAU+lKm41r+pMDbQXnBn2GJwrVP45nM8Kpkr
         ikey7XDgdoRQGNeC2ovMRzfmRv+yoPhpLCBVom75LqJLWF4SoBPFsEndCvYQId+pdu2I
         oo3g==
X-Gm-Message-State: AFq9FYJwQAx26FlWi+Ufw3N1qrG1Ax5ZOlB6R8A9wNHUm46MssQCqGSj
	DHIWLuYu496apRAI1IAHezsfQnHccPkT44lxANFolRN0QY9qLPfsxUulQ76H+01RQ2q+eVSPwB8
	iXoEovd2zvOmcE9UO/tYIhNL4EClXvdG+MAfqV2kYxX4n6lrCtkB1De93HzNDQYpHtw==
X-Gm-Gg: AYBFou2hF3e+BJYrjFe2GdbWyFHSLLO4zgP9zovU5QHzmhquwgPiJQ3OBXyHq4zHiw3
	ClHV/VqWBIzoMMknl47fwfCtbn1BdpIWgoPsNO5fnlHN47xadqA8kMqHCLlfYXRNfs/9tn/Sy4Q
	O/YJOMpld+JXOZklr+AGcmwqfb4oR4LfVqjYr7xHfSe377vPzi7i5f/6AKsNgYzVIUaj6HmpO18
	Nk6tA0aaQhv0Q0TMDP5GraTdIKBd4jzI3MZw1Ip808BHNR0L9cFAlrgysw0Gb7+yxUPBIKTzkTO
	lHEMDE8Q4ZlZwmdcSRS1zf5SNMwjmfz2FDx7KxcYuDnwkkt8jc19UAL3CzHaRPmGLAYG4qP2TGd
	UrvZTxsCeOu5oFI6nSSNLEHyxvqu0LVMxCDWZ/CV6zK9xpsyGX5C134Edw6YTn7BuIMjxyw6Mut
	n7DN4ODQ==
X-Received: by 2002:a05:693c:4144:10b0:35d:4185:5395 with SMTP id 5a478bee46e88-36a423a205fmr5724072eec.16.1793391599127;
        Fri, 30 Oct 2026 13:19:59 -0700 (PDT)
X-Received: by 2002:a05:693c:4144:10b0:35d:4185:5395 with SMTP id 5a478bee46e88-36a423a205fmr5724029eec.16.1793391598552;
        Fri, 30 Oct 2026 13:19:58 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm9300197eec.0.2026.10.30.13.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:19:58 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 01:49:10 +0530
Subject: [PATCH 2/3] media: iris: Skip redundant HFI_PROP_TIER updates
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
Message-Id: <20261031-fix_dec_seek-v1-2-cfedf0c267ee@oss.qualcomm.com>
References: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
In-Reply-To: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793391582; l=1653;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Fs8gGyy1BbD06vtwlN2GhfJTzyeqxPW+qZIMwCmZHYE=;
 b=n7tOrzm5p7DVClpQrshqWegTukL0PD/boqowsTA9qtKnrF0uCA3VMjiX7SRmhfJ3Dshm0WGG8
 saP89Hzn4TOBEPD2bHaI7bJhfjIQ9E9u8ZF9DJufX5VTEP306eWovys
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: GPz_hae2wRfOy4J7muDO5IVjgUqHKNwJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MSBTYWx0ZWRfXxRVs5Y6P+KRy
 YOf/U7GmpBcGJ1V3cNNjQGQ3h138XK8cewm1yCl+DdLD4/6oaV5rMo+X3aE8KUoPPtsi1R3oixi
 jvVIfwZ/0w8nhozbHoPJak8uQc4KHq9S6A/uuCjcYqA+XIyGR9WD8wEjKG6s2sqJyH3bzIsVegS
 0yJKoLnRKCNuQNtgHXIQmbFG7s5Q74m5bM968JB5bJzM+ONJfab8aXvOti50yJkJF15ZgTEY0uh
 UG/FiviARwmSeQOcriNRP/x4tIfeFLiD4ZskRKCVSQcwBCd2FB0IGRYoli9r7HzA2gM1zj7OoZn
 w+jCCcMgekt1qFyyi3t3shro3T8bVafUulniUcVrND8ee2Nofh9Gtw4R8LSvRNGVLkc5O/Ia9vV
 jeoMIadr3O4WdaDRUK7O1GEWypkjf1TondOJvqDdOpmvFAi/wg94GxS64b2H+EtwXP9NhwxFy8y
 /bX6Csga//yy9fBq1nA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MSBTYWx0ZWRfXy+fX3QAjyfjv
 8dmfZUfI8Xf/1G1/nlwXOhJWfSGYkOIl9waXrnwHeCiZIXGScO4QtHK0szeIUAKSXS/B2TcU0IQ
 Po5MrXsLGXg7kDUjT018aYFUwuRwKSU=
X-Authority-Analysis: v=2.4 cv=NaxzRGD4 c=1 sm=1 tr=0 ts=6ae4fbf0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8r_SgFHEyvr_bYIatxkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: GPz_hae2wRfOy4J7muDO5IVjgUqHKNwJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300081

HFI_PROP_TIER is already programmed by iris_hfi_gen2_set_tier(), which
selects TIER or TIER_AV1 based on the active codec. The TIER and TIER_AV1
caps also define a .set callback. As a result, iris_set_properties()
programs HFI_PROP_TIER again through the generic cap path.

The generic property loop sets TIER first and TIER_AV1 last. For non AV1
codecs, the TIER_AV1 property is programmed after the correct tier value
and overrides it. Remove the .set callbacks from both caps. This ensures
HFI_PROP_TIER is programmed only once with the value for the active codec.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 79bbd06ef8d2..6888aecec902 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -997,7 +997,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
 		.hfi_id = HFI_PROP_TIER,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
 	},
 	{
 		.cap_id = TIER_AV1,
@@ -1007,7 +1006,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.value = 0,
 		.hfi_id = HFI_PROP_TIER,
 		.flags = CAP_FLAG_INPUT_PORT,
-		.set = iris_set_u32,
 	},
 	{
 		.cap_id = DRAP,

-- 
2.34.1

