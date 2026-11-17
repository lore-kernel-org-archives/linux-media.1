Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910108;
	b=JuinLyDyL0j1vfFO5ROkQwMBfenG6w1++XJPdqai71Onl0QLRcQ3aMYVoh6LffsGJpSQ
	 uqhKgWKumhP8SyPqn6RXQidaGRY6B+EZkFNz+cld0qhg8XVANOf58gzk1F87IKU3q1LUm
	 09owFl6KXkcOJ98wk8zNUX8Si+g2HRIpHV2d208o+K46ejdgEiMfd3ud9ZMegT5PF4ayl
	 bvxcC7fSsfmIqAudL18iKM59rhTaSXZdG6TSWkXB98zMDw8//xV/49Rqu3DgmT7gfRL8y
	 3s1L5K22dw7Vy7psIwzNhNf4qbD2zCTJAMBQHqeVCUwZDu7ZIOB/7wJJiRjH3HgLBkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=71/VVXS9BeuWmakxmuuJ3siEvp9CNaloZsNO9/RiEQg=;
	b=RvlYgRG5nphu/p3s4s5g3/iKEctAb5XE7AfWRukIWyFIkRlBp+tJH9I6vsLJfc6vEe30
	 S7p+v15OrZ/NcWA+RanSG/tZSYIbEZxMo1lXQ+ZJExO6USzoyblG+gc/WEexKQS48SWTR
	 Cyen4uxaf1e98bbsfMuMLhBli2oHbsHIqIBND8tBcaoLQx21vDE4DuCp+Np30vcvkxXtO
	 GCYEAK76P22KqS7Zwte8zdOkLbZ9xR/Rmsl6dTL3gvwAiWftVBaJrCr6jW0pFxJpcAAfN
	 DbdZFuxrJKzWuCWp+9LRZKk+Hl21pRGwJ4yrnluCWenJw7BVnwWwe/iH9ICg4cy192Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AbQRl9Sp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=caePMNoc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D62606A32F
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68D62606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AbQRl9Sp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=caePMNoc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6f6MY2998730
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=71/VVXS9BeuWmakxmuuJ3siE
	vp9CNaloZsNO9/RiEQg=; b=AbQRl9SpgK1WuJyN+6dJi9yULWVDP2AgW/J6kEMC
	BS73aQmJLCFctBdD0PnGgJsbLJ2ndqieRJPzmld/RKi57wcF47KGYBHPIQizv26l
	BE27Jy8zCAxbYw37LzgUKRLAkdK2PEayYSBdTZfvuU9waqvb4nqFnYil5AcOuanw
	7hNDYswvpwAqW/uAujNaI8MQ0qiddi1H4MFItvQHcn9kGtzx4Tlngzwt76NKTqXQ
	hqIHt+yfCvn9f9cqdsmBWwmj3G8PDkltdyDZCk7G4gaJ5hpZkapMCkfpjdgFe4eJ
	FdidEDDLSwWahWhSx6OC6r9drR5L6JbOlSh8J0J5vTLGyg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve0uhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:08:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944138ed63fso678250585a.3
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 02:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794910106; x=1795514906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=71/VVXS9BeuWmakxmuuJ3siEvp9CNaloZsNO9/RiEQg=;
        b=caePMNocPmZTF8ew3Q/1HZkAh6u7Sv2rw74pQl6NkzugOaiNRL56OWFkgmRs3ulNUp
         0ZK3ofM0MAt/UH5IjvC2t9Ewskj1AT3tt0obOu+nMdvv3q/DQN66QAvOCaItIbKO8s8o
         SemTzQpo/0TKovEOcZndkSQi46BcUrYlqqIc1kskJPGWB4f/xs96gJHGMApLVzggRhKZ
         jF+uQxNuwWXxbOlhtD5aWz8No07emfRcKDME7ux5yBfco+txUGugf9X1wjTGZW8uTc2M
         Pa0GmsQ11+fBOCpjG/qP3eDHmY1hR0njyeIFiqKLF1jdK7jEGKlthaVh4Sb7IjaYJp2W
         dnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910106; x=1795514906;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71/VVXS9BeuWmakxmuuJ3siEvp9CNaloZsNO9/RiEQg=;
        b=odHHO5dRzSwz/LNxvJoM2x04I3r/++dr44D4JxXHqNTquINbUoDGAEPgF9SimnBNPL
         76fgVn5w9/nUt7B7ftsFZOtjdLp2UwqwnF3c53w2CYmvP7ZZ0kQ2bJ12+mjnua2Ps0ik
         Dy93OLHY/q9ZA/ereDTTdLe2X8RFW+ubTwrJDn7TuNL2zaXQCXm9Nj3BHmBWoLUvFvL/
         XlDMWNNdYNdrOcDn5ct+z6Di/HC4xdjflxeQULi36QQXGmrVOLjUETgS0UxnSaRLgb7E
         j9gLJC5FwjDPh/Whsd9itV8osBElNO+TzwmJxMEtpHrVYPR1d91CkB+unKcoWG/y7cE2
         0+3Q==
X-Forwarded-Encrypted: i=1; AL+hErFtFHRlirUZ5ibRaURlIue7x6FJAWMePKNajxS2ZGg0bR5LAGF427udCrUZenRf2TY0hFfX4Ayy4O7X1Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/UCYfmTUP5NoUqTLx+iSpD1wa7kXcnGj0YCQFvJUJwR7aEIL6+
	SgR2lJ14jj2k4M+BJGT1CAWFdLCb1dvwsKA/5GuSDaZ4CdOG9oU1LGcx4hDEC2+B0mLtpuRk49Q
	lJQljnBuSHEMpkFcpGG7p61QlChEYg3pDg0VzuJneqFaiZxqioGhTovsPJ0CXs8Jl8Q==
X-Gm-Gg: AYBFou13P+kEf/lXSzbSzm/tXxiclMkfla4gGJt7xJGaJnyoBWUb7TbqhoN8BUlmULH
	fbIoEZe118xVF026/LIOmLrlEgvbw3qI8yFrAvlh0k7uh8J0lFcOC3Y/+8zH7s3qFPx6ge6aCA/
	8VpyLWWHBdPQq3vHv/zwN3d5f5Goxm8T6fdI6AxdJmn0wHJ9ad7d2JxqJPfsqGOoxk/8gllVRd7
	ZuTVVfR5pdtWlVUkIIC1Kq5d7/1vI5rr38I8GmShaYdsib5AzinrCXRilWCzKLTulWczzWuk30F
	Ib97sNnGR2aq3Ldy0A4cvOZLCmS5BuZ0SUKSSfiT55MBWVY1XA6BDn5hZgG17E8HZUmwlFiS0Ey
	AVQzjrr7/4WK2wiXCsH8Tu+VEj6ZquQxiTDrPx2QegeFZQTq5XzsAYGezDz5bIlEu
X-Received: by 2002:a05:620a:45a4:b0:949:75de:b22b with SMTP id af79cd13be357-94975deb4d6mr1050249785a.2.1794910105486;
        Tue, 17 Nov 2026 02:08:25 -0800 (PST)
X-Received: by 2002:a05:620a:45a4:b0:949:75de:b22b with SMTP id af79cd13be357-94975deb4d6mr1050246485a.2.1794910104932;
        Tue, 17 Nov 2026 02:08:24 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7813fa23sm69006895e9.2.2026.11.17.02.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:08:24 -0800 (PST)
Date: Tue, 17 Nov 2026 12:08:22 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: eliza-evk: Enable iris video
 codec
Message-ID: <butvfwbrzocwbiftgdssebxnlotirut2e4ub4few4e2am765ju@w3xluxibav3h>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
 <20261117-add_iris_for_eliza-v3-5-02a55a9272ef@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-add_iris_for_eliza-v3-5-02a55a9272ef@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfX9WBw4MD4gDG8
 7OgUs9WF0CmKg4/SLHuuivWBa2BR8tlvRUAENuchepbKT5QicT2el2b6rTO7oDa7HiMhgvTO88u
 swxIKZmzdvoKqt6jgQ2tB4zqYathhQI=
X-Proofpoint-GUID: JXCAN-l16Udktn0sovyC9X9SMD6YYio7
X-Proofpoint-ORIG-GUID: JXCAN-l16Udktn0sovyC9X9SMD6YYio7
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc279a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EICV59JFKgBgiyABiDwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfX3cFZPhAR4l39
 oIKtdVW93SRT2GVYtX4cQk3leppKNgM6/G8U6pN+fOx8miDWMKTHgkZRm/+sglhlrAwq1VFUyjB
 /MwmPofS3UqiLfDkkEx8wPpNzCAuPlboOrfi1CcsYZXo5R2XapdlHzY55lwPyZQxnpZPoSoY/XP
 YQf0BKOkK2fqIPyp2o7ceiCPiCVQU5Cx0+ldINzV64zv6VTWhFRbS+GcbiWKoPB6xstPxpOJB7L
 0DkF61LRYIzVlNl7it5IOmhhsqLWu+Zi+TxoCupL32HNHi7TLMlbgoUgyb/VsZLVHtTfmMbGoQX
 4tMt8xYgLTLrJh6k2nmx3dPc7mCF5iWGX5ms8irBkZbBXB1r0/uybBwXzQdzhiCEVy9mE3l+LSP
 pWc5wQ7LMjtIeTTz5dXu+bmcFJn+8tJiaHa2PHs4qBWrYUbuiJV8n/BrKQsn1S460EHzPPcabun
 kYJrWwLfv4fw0x5dfXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170040

On 26-11-17 14:34:34, Wangao Wang wrote:
> The Eliza EVK includes the Iris video codec, but the device tree leaves
> the node disabled. Mark it as okay so the video codec driver can probe
> on this board.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
