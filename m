Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591233;
	b=dQO5Pu7Ic/MLqarjiEzN33PxrTjKRO4B0NKgoi4bh54jl02eL8+oNUTenlGV2WzkT356
	 LniSgKkNpknQntSUV3UEx6YxYiw9Q8kIfvp5EVqNWF5On4bosTSXUXlx5MXAUdQ5OEhXS
	 n+RJV0OoMjlcu1HG48ceQvzZlse02kNcxUJ6KBes3dCZL32Zszr09mrVzy8RnKC4G3FAW
	 STgMVKah177IahyWrDyBOu1RjaCIfcWOmjtBMTyfxoybDPPnv0M/BZiLUY0uQjRafRX84
	 Ev5Fo9JsYUw1JIiSfTJcz5GMJqxBC9a8bFRNdLqKNS0LSc8iLowB+vJYklBmE1Wz95g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591233;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+3tXMKH1cZEB1OAWwRarq301e8JF9qJ8xcXAxkIXA90=;
	b=A8PCh1Tao+jVmuXc9P3lvpwYjKTBb39Uj2gKKVyo6AJsNNiRxJkb5TQQC23ezzYTmFQR
	 Tqys5b61KE7SEVjOdi7ipRaIlZt/sHgKzdaw0XauDiFUA51RsVg9o2dSUtatswZWtR+eg
	 xPnLryzMf1nGBkPan+zMlUs9hThw3eBX+LTS60OLcjO3J+Oij2KHiYeVbg0mqNkZMUvZO
	 U0xQMzrMYAAZnTljQBqDq7HxHWkORHLS26QO1L1xGqDhvzNiGSO6R57fwv8PBsQzwkpEW
	 r9YDWa0WMq5FmCaPFnEpJWb3RHrHtnax1XWQqtorAUO6c0jIG9sc0jkMGrAKhY0vexg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=anFs3Ywu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dcpAckaY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79095606A324
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 14:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79095606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=anFs3Ywu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dcpAckaY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDIVxt3869333
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 14:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3tXMKH1cZEB1OAWwRarq301e8JF9qJ8xcXAxkIXA90=; b=anFs3YwuuX1o37vW
	4zYwv5s5aGMgXz8XlFBBMG+cu/YjA00QUe6oESLTHCOM1WL0EfNjYPu/OCUcz20L
	woYdt0/5SoOV92XMti0q0YpmZPOl5UEeGCQ0zuUYY9r65N+MVWh6Gm7AKqU/LmdA
	xBQ0L6lxlHw3+1nSiTk+vmylMLLa/WD9kZRa/FxpC+U4mIVl179fBN5Dxccz6hOp
	5pfqk5yB49HeeXBBo6RhTMZkaq2QnELVvhaduiN2hLykk2eQK4g/qWh/vQuNHYDM
	l/5tPvo+59rV1uX4nzAUDK+UPxqStx4APjpKYhbdDH3Fl3JTb0kLRoORSHBLUiB5
	L/utcg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q85p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 14:00:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac58b24so21514385a.0
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 07:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591231; x=1793196031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3tXMKH1cZEB1OAWwRarq301e8JF9qJ8xcXAxkIXA90=;
        b=dcpAckaYx9lDocV5mDzqQl26klPR4wHdtTxJo4KicZtL8Esour3kdNJ0zBfsSq2uyy
         6K5WRtxtfAFKQcGSCl4RNXwmxtN5EQAE62/7vfBbjT9BIFIAXEjCVQu+BTOSMc1aD/aN
         yoAvtfAJXawpJPhYiDlX6fyJ61+6K0Fq08AhXVODuNJ/CIbDhC86pM/4OB72H4u9fgAZ
         Usp6wZJ1pWYWwF32zaC5038SXdq39KnJJoH7BWKKcvhqg/1MjqXg1B29YG8TIzINPB8K
         tDtf3H30TOEXB5A6pwyYq1rM0VCst1OARrgdq1nkw1yxG3N9iP4MHGgDp/A9oMFuLht2
         DRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591231; x=1793196031;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3tXMKH1cZEB1OAWwRarq301e8JF9qJ8xcXAxkIXA90=;
        b=BKAhcoMTTjefQ6RUVLSFCms0yH0TOzq12SWniuBN7qcPd7ulMV1LkzjCKIRDgX1Bu1
         5RpZb1HtRIOW7u622X1OrcUJsiEMlZHzAXdedvJiSszzn9n5ZabRLbu/lRmQSldAOB/7
         +4Qyrn6zp/C/th6GasLL8MpMBgDMJj55Syde7+l7o3rXA0IJvkA0Ew9hFQe3udnn5S+E
         frvPsYrbE3F86EUVWLozZTYr4WX2k4wRhmQ95YHYuK8baLQmlwSndtt2pBmQIpckdp1k
         zjMbsPk5yarQCcZ5vo2DBR4sMXNDBvrjBpFfQEo8HgQjrn8tsmfWTzB+ABtoVzn0hFs0
         SSVA==
X-Forwarded-Encrypted: i=1; AKwUvByd5x4poACvcG+Pz1uOy3l84aniaJDVYs9LLIJrape73DHfK6E5tI02r2e/WWZ9wXHx2azdoinwc/WQqw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKqDGnw/v6kHA4LsQ/uL3db10HyhDz9TgxeVE/Mw3q5bhZDFG60
	0HZqRyJ2yPAE82fi+kb80VrVv0JNcpNUFhpRed6+s9ewm3dtvYd79awQRQAUd76TniNJiQgck0c
	+Zx/5hIHhn+ekIpqMbBIcEFq84gVMzCjakqcsqSrfGHmnDGf8aPujWiBfCs8maPWaWA==
X-Gm-Gg: AYBFou1GxVYHH9zH2SA1Z9N9B9/XtPCecHq+iJeQItSb7mlgFIQyt9qpYH31N0CGqou
	QEQQ1qrV8JuqClGqVH8E2jD5jX5hTxcqQHGUQDf7pNiOMOlJAACm97GXxWhivuI8Au1RxzGzXaT
	5xn4rUpjJs9a6LgwyY0D9VHaluUkEB6aIT2D+pqWMlosU69KRMJqXSdcYqbhTsWGaSGgs2DrOvr
	rGkVe8x674SMhSLE7q/JZn+kouWLE9OLPSLYqlRkezDb3i2xCR0+4fmsm73fyu26dYcw/RfacgW
	C34mdS1BRy2QKKhfrgAQK0kQckG8Jv6VTccNMAFhjSPcy3s9m2wetocXERyFt/LOvYM2tOoLP16
	bvotFlXDnuryCM22UYGv+ZQ==
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr518059785a.6.1792591229876;
        Wed, 21 Oct 2026 07:00:29 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr518034985a.6.1792591228650;
        Wed, 21 Oct 2026 07:00:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcc5sm7861166b.26.2026.10.21.07.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:00:27 -0700 (PDT)
Message-ID: <33d4d460-684b-4031-be45-3768e8d6c092@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:00:23 +0200
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 12/14] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-12-04fd28d815c6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-12-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX7whJ/LwA+u32
 hTY23+xsj/q0Q69zXOPOGkGjvA2zrhat/GaQxA6R8DMbdjNxYpC5cygSphqSMpuqwUD16SXnWex
 vFVlxjU+vAJ6gvTQhjVjPRF7PvY0h9Q=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8c57f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RPG6soaBvYURGeOPBHsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: sNm-t14WCMSCMVVPYhhSvc4bpuAb3QYV
X-Proofpoint-ORIG-GUID: sNm-t14WCMSCMVVPYhhSvc4bpuAb3QYV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX8DRw84G/Bgzv
 uhOXfeyt/SzpKW5CVfoAv5EPh178cQAXLLTp7T3UlEjVPs86gbBw+Ukk3iYEWhv8B1B9hlu/gAY
 SAETkleh2JeY8qEUnQapxpy4u/fTu6G9Ql1EEFw8EWjQrPOb8AdUS0mJapBxPaBwaqYupYNpNkq
 zCNr7pqwz+QlhNz8pvrSDFQHkLLOfkKBJRHvzMC9WUjrzwZBHTatq0uAsnVD0LjwVcdhGLKkoYh
 9hZ4AI6l2iFpkNYRSPdz9r1bGlahxSd46iACvWkXWqug0GTPXFAvL7MzwqtVDRN6ER31V1imyJb
 fG3FEfiIH9YgoBCZaZ8PjmTDqgNIzlTVg+zwmyCVwJCFXB6pO1JjjY6qlNSafpymLJBtO8FrjIG
 yACh9mzV8wiK0hHVXNOJa4ei++fip5cJd40kHua7n81jFlK1ge5mZulggCNx4NLnb0mWULGjSiu
 HNGLJaOMQml7jUaC1nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210055

On 10/12/26 8:45 AM, Hangxiang Ma wrote:
> Add the three Camera Control Interface (CCI) controllers present on the
> Kaanapali SoC. Each controller provides two I2C hosts used for camera
> sensor control, so define the controller nodes and their pinctrl states.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
