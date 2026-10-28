Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201293;
	b=vfS6eYuySCfPxQmfdJrH0djZfPsXC/Yjj9A+czUjbU0Vj2Nw42kVJ1aQkk0T5GRJq6We
	 mqFV8N4MwmRyn2inRxcgdSkGaMr2GkK84inU66MczL4MQ0y79M5FYCK8f9whtyM6/NbMQ
	 NS/m6JwuaiSm5AhEWWXv3dMNDodDN6KTMamxCORAa08hpgjp7Z0+Hs2W0ndqzgdvdLn0q
	 /LlDU62bs3Y/etV5MlDitvgoD1F3g2mi7ENv069hHGAb0zm2mTylv666lGM8voRF6g+lF
	 0OgjgBudGSjW68QipDZCgwwSwJ3BlP1OTF7/7Os5sCS95gl/gcQorP2KAISr4JUYiWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tpa+XQp0QDFpzE7hdPD++YKPOso0isNfYovif6itICc=;
	b=V0HYYYhm7yx2PEh0u3C/1+pjHdGqDkD6Zw5TZxJxLCoPad7uJiQ1Yka1a9AvPRRXyYZW
	 m4LhaXgVMkU8LZR0MRstdU0me7FrGYHHTZZhEUY3Hp8OxhM1CjCawEtAX1RgCJcRjAEGr
	 /nbIGfaAQGijKocn11W+A1I4g/qpgNx6lZOTc1IBEYBQJ/3bOG1P2xlAaqL2rBiHc37/Q
	 1FHz4CGtXnfpsEwGimnjduvIVbzWSwG2qbs8Xa7sgnayfNuTN9aezA1ZbL9CJz7a6udjI
	 FxmCgfnHWT5chCMZrYkLVBCDMV7cBi5KRL3jeUaAS4GLKKSBVtx1f6zTMw/o1k5kuNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlQ5B+eE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2LUuQKR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8D6606A31F
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D8D6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlQ5B+eE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2LUuQKR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA3xJ599981
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tpa+XQp0QDFpzE7hdPD++YKP
	Oso0isNfYovif6itICc=; b=mlQ5B+eEc7Dzq5a66JgUvlZj/cQNxd4cC18+XRSW
	2c5i/zV2QFyO8Xa7hIhJiaYpvp6eBsES4ePVEU8DznupN1OTdBf6CGQ9HFMVL1nt
	CQnG2t9D0nkwT+dET8JjAfy9n1e9+6/H5f7e2uG/7L7z489cZKaKRNcnwNQdI3pf
	tjLSuAYkP/S8BqIbPIwM+HN1FFr50yUfIAN0dNUaKxudRAyKooFM7nmUHwPHQx09
	jmslFQc+gSN7fUGEHNnXTE+mgAW5uP/XA2t5p7elt4nGKl+tb36KcksFMae6ddqt
	8nP20cFo0iNzRrl1A+3hApOjNIlrRiQjiuS9IQVIKMbALg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f93679-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:28:11 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf45388253so17955137.3
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201291; x=1793806091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tpa+XQp0QDFpzE7hdPD++YKPOso0isNfYovif6itICc=;
        b=U2LUuQKRJFlcHzgU2KMgH6TXXkKcGCqVHmWizh7oDkOHpXGZ0sI+mqkd2HkRhBF+LK
         m0GCfSatrQIVYFpCuKkL+Po6hKs2RtTfd1+3sibKRNEbe5WXSBqCWOFBxVb5gOck9w/j
         0LwpDw7wrnZE6R2BA8fm9MzHPl/pXpCwlbaG2OiNFwylH/rzs7/4EhHwfys65XgAYodi
         Qw5Kx/ETmMgEywOHXC6McRtfzayzpHMC4UzQE97JGxClEEeYXOwm6wgKRHt7ZvXSAYNK
         xGhRoBatds5Wo+fQvuHyBGieOTJlWS46j8y8Oj+HQgEyfqFcwJsXRuCbc0Z6L0i+33Pt
         ipsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201291; x=1793806091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpa+XQp0QDFpzE7hdPD++YKPOso0isNfYovif6itICc=;
        b=amNVsvbNCPkTDnGpCyOyH9fcUXyJXexrEg+H8btWDtws0otzrGwZnIPUd92xI80sbb
         vMcw/C1JS3Vp9zxtJzVPz8jTQfuTbGxnKabxZmZLbJriBe7uwXzmmYd7t7SFhJ9KEQl+
         ISCbX4U5RdzzRjG+BinNuQc5bTcnlUJXqsCyedNsKBxtj2wOHKvAzs1lZD+FMeY41Bwl
         1yvzXG7x2MHWhfE52xL35GsCBojoUZE9fYryk9baRuPw+Dh+ui76kBPcxfnizlIw3y0L
         WEmX3eoyDNcAUBieu8dA1xELBCoCufXFGsxE8rdMaT7JDouez0jI4VJ6DFjzWF+3J4v7
         UdjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEcn3MRJTBNhspLS/J9ukl2KfcyzArswMXMQMzccBLEMDzkVr6to1I7idN8q5ELRM1Kdb+mWtfksesbA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIHfYjHsrRpEMdTutob6zuVhUTvuosPZV3HiKdZ8fwrHj+I7WnR
	Qerub1KjDlO9Xx4CAD8nlwRQ5QT26Q6vYzS6PLVeKwzQ+4PhA2Et6Akmo7DFdMrgPK3xCQoKxJM
	ULSHDNPq7q1wNoYQ/h0W+Um/ed1GTwUYIeJ6uBlLaRI+iriDfOoEAr0HixE3ElUcHiw==
X-Gm-Gg: AYBFou3G6jEnSlmBO5SIwQ+QmIYHQGetTSPl8QQRId9hpys+3RDPVH2BMx8RWDEAhnn
	2NYZySv4ys/bjD7cixqhzvaKfnOFQglGut+NNAAEEY9y5gHJ6RUpcip99LPlXWSUvl/VTYn8Uec
	5KxNFeLSNnxt33qXX6vhctTmHPBW+88llRQfWKuAmF46JMvmd6zt5pI1vcataBEL74dBJ8teGSK
	Qc9I/lk3M4pAhyBQV6ghrrgnCBXul8jLwjEHLlMlwz/wAfK2aADQ9STCXikIVjiiwKDCj38rMu5
	ssgCugRm90mrzH8we6QfTCo3Ax1gNk0u/Azu+eQsBPGv+FgZb4HKGwN36EyAiqXIk5IMTeGOjvS
	ftYDfu3lneIkiJsucJNC8TEzN9GxgE2ENpbFdRuDUfguXln7h1ijlBpM+NoYpw/LkJw==
X-Received: by 2002:a05:6102:149a:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d03a59fea6mr1496672137.36.1793201290582;
        Wed, 28 Oct 2026 08:28:10 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d03a59fea6mr1496628137.36.1793201289890;
        Wed, 28 Oct 2026 08:28:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm54505e9.2.2026.10.28.08.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:28:09 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:28:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v23 12/15] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
Message-ID: <5uovgjoe7w5z5equxekkmcnqhlmoi4ruuykea3mel63eyyxh2h@ovvzdwu3hfjz>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-12-95f250b18612@oss.qualcomm.com>
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
In-Reply-To: <20261028-kaanapali-camss-v23-12-95f250b18612@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae2148b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4HpnP7yKktpVlNN_chcA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX8lbz0aBW8PMr
 PXlEo8aVH4E3bMeHhTcNEO78QaPKNlqz9OpvFNXw0ztF/9xEqjL/XwHQMdCxBOhYfkQXnkTOEuX
 9xWLUZjBp/1upJjMRX4md22RZ/mDiO0=
X-Proofpoint-GUID: 0Ywau8mRtLuQlGeMSOOAXx2yaNOR_Gar
X-Proofpoint-ORIG-GUID: 0Ywau8mRtLuQlGeMSOOAXx2yaNOR_Gar
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX9sfpSAAKl52W
 3xT3aPhvxythg30oQ/4XJ8waa2tlsaNIOUvxohzvZx65Lq2MYOc/Yg/9JgwTk3Gawd2YmGILjB4
 aRxe23FhtwQGUGrIaTxlM4emYTaeie04UdEX+SLzk5/s71xD4Mg+2Ji++/ygVYwrPxGsphryy1r
 Rxy7BsfULsbSNc7jkhyELo4FJaWd3khO0cC5rV4hNcA/MZGltnTjwa10s6gnRI8EYq0VO3J86nW
 YZZuhfG/lI7UMcwoc+EQnRwB04BgbmSHxAmKneAXQxV8xSx1EgS8ohA9U4u5/5aPfdMdSTxs9az
 dT4p2Y+6cWMGG9iUmNSNotNWLbv+cfmKZj7370kS418tVYSlneVzQtYbNSQMqOgESFuSq6fx3On
 V6mfoxFYqzRHlh2VvxMHCQpPRcqg/Yl8IQcpvkY1ELBJymHuoHUiu9oGNljburqt6VIHq5HiJpU
 WLhjZq0hOI+6tGj819Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:46, Hangxiang Ma wrote:
> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelines
> can be enabled by board device trees.
> 
> The camera subsystem contains:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
