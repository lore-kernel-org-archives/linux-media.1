Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402900;
	b=dDtxjbeeDa8GHwWm4x+W1xZVU/wJabh1rgORAhVHonagPiKTbQs3jZvU8vnIvXYfB/8u
	 HuzIo0JnM4IZu5exv53rGoZU6n9y2Fodgn/pbq8Gd+LfvIsYgQmWR484iS8ruppVeiWIV
	 JO8QUNojqd06Yu1AdT8NgxP5rvt9cv52vx5KskFQsr3bMz1N+TX73y/6LqMePsG2dgFD+
	 hWDY0IRge2PnKvJ+u0RqnYLE8nAIeJNeeWwPXff63pQ3gmNdwpSZHtsMeLQuJ/MLWSVtu
	 fvPBLlOqe87tJJwUZGybvLTfZJqOMay1wwJZSgtupg+IJ3QLn1tInjqdfavnXkp7vqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tLARcSRWSvevnIhYpFOUnFGS3qKDWwMnqMdZ7F5zyEw=;
	b=Bi40jTxwMeq8LFP0UxchbA3vEfZL17Ey5JYkRuFm5nj0M62NUHFOAf1UhGWYG5qLJOjR
	 U1C3bEjg9bcKe2w/Hoo3UAQRQwAWncAm89zUfcIdmY2h5jobvzNRo6iu5XABwp4+8xIHo
	 41aJ3Qjt0XFcdbNvV99FMiJ0UWrPb6Te8y+P13sv/373vycONU8A3Om4ZFjZQgm2YU78L
	 XfqiAkfRXxPI/Z0BgOY74MUPYySBh6BJIz6psIdiIVJtPog7ZwIq9Lq2iUsRntkUNHNaJ
	 amycqZKEQDmfPa4jDR1zSC0mjYyvYfTKnCxO+ienvcxBv7H8bdX2c72lcMAbyV3y14w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wqvouyij;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QtFjtj/c";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD0F606A327
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DD0F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wqvouyij;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QtFjtj/c
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYr0O2356368
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tLARcSRWSvevnIhYpFOUnFGS
	3qKDWwMnqMdZ7F5zyEw=; b=WqvouyijUrOk1DUJ6M3CdlTnuxWmS4QaeFAd3EwD
	dhrvlSAfVfJL+z5egf+CST5PQpaf3ezbv8qWApbEdOCiYEv0YTIN0wK5p6+Epd7L
	rUhTle486WvNs/YrxHY8/814TV9WQ+ZdHJIZMPs5C1sFVskfoaP9UF1YSYHqbOpo
	vYn9332qpC3woGUO6uBUHMN4BmXgYYMr7YDMvouidZ1vmAor0PJ+C1+JVdzo82/k
	MSJ/tcIS0LLK64Mi4jTF8R7EVQnqOhWukdQjg0sdys23+VgGa3jO6EcKfLf/o+3v
	7S8CNY4iOGbHA1FOXAEe/mxCxqaoF2AWWMQAf0qt6HkrKA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdhy20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:14:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb98809caso533153185a.1
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 05:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402898; x=1795007698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLARcSRWSvevnIhYpFOUnFGS3qKDWwMnqMdZ7F5zyEw=;
        b=QtFjtj/cT6ns48OQv0ldbES0V3eci9yd6s74s4vT90+AMOpbxE7kj3Y6u6/z6FrVCi
         Y+SK4r1G58dCbnIbUxYrfQY6aZ6p1anJNyFGAyk2tQHvbMVeebPSOmVGDV5vTJQAGjwg
         novxHnjGhRxipByX3PlkvP1lY2CjHT8DPb9yaQXEmbEQB3JgsWmH8FsnX4+FDYylWeps
         owR0QaJh2mEVLfYAHQS1vLf30YkjGRkiy9SzWZqduEuXC/zTawrKlAtqJNM/781eRaEa
         wzA0QxPBnM+GHyY5jNH2pyt8nmmlWbu/C+kwvlQbimmaKYiL0ENiZ/e2zIAZF3Mywnoi
         psyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402898; x=1795007698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLARcSRWSvevnIhYpFOUnFGS3qKDWwMnqMdZ7F5zyEw=;
        b=b44UdaJsveB71XFqx7kksEGHj/joijDyEwepBixy8LOBRt/osxrtutrxRliujSvhvU
         4OOirNLBWUO3YMOd0I2tHjhbdQ9Ph6j7cqLsIA3/MZ0ZloFx7QlfULPqTQtQY6UaeOLV
         iDOCmDRAd8n7DCvDLPXc281H41ADDVRZs3WtaamIHxJ3VerppQJzFo46nUa0XLWpD/Sa
         lcb+8S5wXrebbQcfg+AVLoTIUrHD7oJlDYTxQncffyMsOEUNAekHKMAQCmEr+zjAn71m
         w+spCv7zZNADmu24DBb4traSdbkmIxU2sQU5mQDgusJWoBP4VLZdaSN0dzPPUJnQft4j
         YDnQ==
X-Gm-Message-State: APuU4Z/Ao+FSSVpJePlqjJjDapCJIDSUWk5am255rxk8H+8sun/TWtT5
	H3gupo/DbF1YG/koSO4jFeLTmGvbD8loY8dLKDw5X4dX81V5i5Ym7YNz65Rye6C6gPNp9uUjo2d
	lUYMZJXCI/Aw6Nagr71Wuurfvr9GuWkqk9vjkgu/zja/8HwfQlAozXqhVdYi58vextg==
X-Gm-Gg: AYBFou0OL6dYjOkHTCI+UWSFySo9DOKZ/868zq7ptKPnoEmdYnZen1C9oJjZb//F379
	CM6rq7YYs//AH2cFyw6eoWB+JjgOUlB0ojKbD1fHyNXrZTn1bs4T1ndO/jWG2WIA4tpUULCWnto
	Z8wBWSpcLw9pGsHH/r0yF2+khrErm329n2Ivpg/Gu1TJ9KcqSQLbjMXJu/U7m1jlNLEf88Nr8J4
	bKq6ajX6R18gcoljpWmvpAbpg/lvtgvlLCSUhC/Gwjj9B2VjZbQWs3xdDbAtqIQEnYNNO+HYx2H
	8hDoWbnHp6VfOzfWLAzGIgInuovYHod6fpEjbxJS3VbtPSNgJ0C4mx47lMGFB4Tz630JKJJ/nzH
	+aep5vsJikjXremE8Sx8jNv8JI9wvkYVxvlErecFKHalucpZVTsGi8Z68ih67nQNpqJwO94Twse
	GFbNvyYw2F5qzEX9XKzeaIp00/syv+p2KJX85YWveEnBlXk3bmpk2JWKnRcoBiCA==
X-Received: by 2002:a05:620a:4054:b0:93f:2941:6b8d with SMTP id af79cd13be357-947afcca89emr372346185a.6.1794402898446;
        Wed, 11 Nov 2026 05:14:58 -0800 (PST)
X-Received: by 2002:a05:620a:4054:b0:93f:2941:6b8d with SMTP id af79cd13be357-947afcca89emr372340885a.6.1794402897888;
        Wed, 11 Nov 2026 05:14:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae090ea59esm9929161fa.0.2026.11.11.05.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:14:56 -0800 (PST)
Date: Wed, 11 Nov 2026 15:14:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/8] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <3ti6ntq6ztczilnwv66ak7ohl63mgw4tv4mdbsiy2hrkqqqjow@rmkwrasthd5e>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
 <20261110163909.78085-6-atanas.filipov@oss.qualcomm.com>
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
In-Reply-To: <20261110163909.78085-6-atanas.filipov@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af46a53 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ad0ScDXB7ZbbMzgY0o8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: m95RoS3w2nZNPdughzeHeAt3LhJyZjhF
X-Proofpoint-GUID: m95RoS3w2nZNPdughzeHeAt3LhJyZjhF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX1qcEdcVU4qT4
 mvArQRNCJPRGbs3olwX29rTEare1aZyeFkSBN5k2TdIuj5Zdimc/ecUtE1gqiiK5RcrCwRJUnV6
 eHsyb4eiEa514jrXV+zNV7dWeE29IeEJ5caPk03+oMj4+2k9ShMQOBxLsIMPvQbtNz1DH7hkVXO
 u+J3jGi4haRpvfKChXAGMc3uYIlbOEuZ6qKDhjjjWCM+q7b9NLshYyEN3fJZQovFKQ7ewCorTED
 /DkZKAp7Gfx1pl7fVwFBd4Ar302lwHl2pBbrA0ZYV1syTVFFYfVq6UC/6mndWvaKqn53Bof2er5
 L3qZ3lPZX6k557lJ1Jtsm3JPyAwzWJc3+1C5WoxBaHeTiPQbr1Cd6tA2qAWuyAO0UD0NwJHQv68
 /d2ymEm7K5IUnVVaabAspu39YQs3Se6aeE1YeLc3ZOp1/vDmirYK/4f8ZEDM9ekqy8l5OYNFdNs
 D0OF46SqCNVcLc0zfQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfXwQiDX2N9EtXY
 m+lZ10Mjy8nlhKYG4mLo61qYNZUNOFdSz9l3mAIiVyaT9WwxyDkCAWdo0Of1xDraMi989J69Iwe
 5TOjddq9YMe2rwa+39VEchUarkCN288=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

On Tue, Nov 10, 2026 at 06:39:06PM +0200, Atanas Filipov wrote:
> Add the JPEG encoder hardware node to the SM8250 device tree so the
> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index f975c2183269a..7e8447df40188 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4480,6 +4480,78 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		jpeg_enc: jpeg-encoder@ac53000 {
> +			compatible = "qcom,sm8250-jpeg-enc";
> +			status = "disabled";

Drop, there is no point in keeping it disabled. (And the status is
expected to be the last property anyway).

> +
> +			reg = <0x0 0x0ac53000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc TITAN_TOP_GDSC>,

TITAN_TOP_GDSC is a child of MMCX. You shouldn't need to declare mmcx
separately. Instead cast the votes on TITAN and they will propagate to
the MMCX rail.

> +					<&rpmhpd RPMHPD_MX>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names = "titan_top", "mx", "mmcx";
> +
> +
> +			interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;

Use tags instead of 0.  I guess it's QCOM_ICC_TAG_ALWAYS.

> +			interconnect-names = "camnoc";
> +
> +			iommus = <&apps_smmu 0x2040 0x400>;
> +
> +			operating-points-v2 = <&jpeg_opp_table>;
> +
> +			jpeg_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;
> +					opp-peak-kBps = <262560>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;
> +					opp-peak-kBps = <524760>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-400000000 {
> +					opp-hz = /bits/ 64 <400000000>;
> +					opp-peak-kBps = <978600>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-480000000 {
> +					opp-hz = /bits/ 64 <480000000>;
> +					opp-peak-kBps = <1095600>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-600000000 {
> +					opp-hz = /bits/ 64 <600000000>;
> +					opp-peak-kBps = <1095600>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_turbo>;
> +				};
> +			};
> +		};
> +
>  		camss: camss@ac6a000 {
>  			compatible = "qcom,sm8250-camss";
>  			status = "disabled";
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
