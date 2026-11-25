Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603988;
	b=LUmzx/p6NyF09WhqVg1AhNQtOEOsVa1aBWSJQ+Zhs4o4qLiu2huCRNnXys1SFUZbLUVt
	 J+X7nUrN0Fjblgm9BgtrLyuaPNCr3gyGNc5EH5EWh7hh9xBusk5rMWfxOJ8DjWNNYFO/6
	 y1HfZG87HX3O5io5Ayw7duOnMOziveItu9vbB7ry4SSyxhgfIewQ9riPQyfOUWlgplEfJ
	 GnUt45qPSpxfIwBdYN7/meS63oC+wyP3MISHdErMBS9aJOhlbCVL9/8yUT5YzMiUtmh93
	 sSOcxjU2k1l74HxCVTW5cSIhJYVuBoLykLCzPCTrYc4sQaw/RHC/WMTnor8yMGF3aMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FebbI9F5mjaTpQVwpaWCeaxrYNjsbfM5/tqyvZhTU4w=;
	b=3XPcbspkSoTseiVbV+Zfaj7J05ToLinEfFACZO4rKH6/Y0QtebmpK89LGN5fGs1ZMy3d
	 giamr1e9m0BK5pXsLPNd2HCLJXNHJXCktWsLNuUhGxP19dirrpmFS2KN4LEAEjSZRl0g5
	 6jGdWlkqyDciuRA6vLSU+AhUAPfDqlYsUVJBksilhVlzMqhwYugvRD50ubev3xN1CcUzQ
	 qTZC4F+E/5U5eie56PlzyyPV41UHPmzohBwDEQoypkDqCR5PxYo9UTLPGjY4/j24hGeAK
	 Kv59fdJT4wH0TsWc0CPdIAVyulVMn0KzyhWwWRQfybszZRO+q4ZL+rQ9jftzawfh0Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lBEkQFga;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h0N6JBTu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BDD606A33A
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84BDD606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lBEkQFga;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h0N6JBTu
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9ml8I3611427
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FebbI9F5mjaTpQVwpaWCeaxrYNjsbfM5/tqyvZhTU4w=; b=lBEkQFgas7Td87xj
	PgUMKCXYiObvlo2EfLiAxp8KoE/szjO0b6T8LjOQSnkFKFOE3hAxgjDE65uVONjb
	vftvXpejW2kREFvhQ591qFGCLo1Rnwvsm+xnPcDldNA6IxQSg7fImdyXSo0q2f4Y
	pyB+LAo0dUSj2Qx+ZYtLCWJDDd9OAaVCLfiwEeoHtqmYb6Dmafm6vQ0x9ASB6umD
	8+V+wqp3fpMH0V3RvExvJoX2obuj+19E6GkPz+dR3YeHSDOKvODytk4MSQ97wliU
	azcMMIGs52cFiInelru1HseH9/VI3JzU8CsMnrgdyjFgtBr9TCdCYJ96JVoekx3B
	ahD1Yw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsb83u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:53:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso48586085a.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 02:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603986; x=1796208786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FebbI9F5mjaTpQVwpaWCeaxrYNjsbfM5/tqyvZhTU4w=;
        b=h0N6JBTu0lax4pHp8LamZmCeGfPqCeQU1V8UgBymAIExJJjh9AwFje2RcdHdrPQz71
         vM2MDUgAloCNRPLMkTUR7ONFoSxHfbVAg/h3GzapxotqETfdQuCKxgd9mHlDLa8XycBA
         ZQs2UoRUQKeOa5gW/BdLZ7SKfZtDtTTV4phQ8GTAUIbM1PE2npSwnMA0yEY7EOdbMSwN
         uHvrSivt45SllGL1VH5tz6cHILvjYdWpcTLu4haQ3C9MsLg1zIXZTSsWvjVg/9I3DWSL
         dXzFf4AtDehX0bttwwXIQUgSydXUmEWgWsi+FNa8lc5E0zUtdvrmO30Ov1+VbQ0tqHCH
         uAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603986; x=1796208786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FebbI9F5mjaTpQVwpaWCeaxrYNjsbfM5/tqyvZhTU4w=;
        b=ng/HbRmrlSMmUuT9G7k0N/DaUp9ugh+H7dGES7zoco2NTBezoZv7q5iyikjkzlbhdf
         O6IHvudSQOtrJoNuYwDr//Sl58FsEuqwjq3SHb3rHrQbd3wnFX7fF7nLjsQ18Np1RZfO
         YxIjU+3x/sHXav9b8WC25wT+0LjxxiFJasgGh2B36+A0wZORr4/s9jy5CxOwowAP5eV8
         wqbGG4Lh11HsxCNiP21Du6ejucZHxJrCNLDwMrm+X88z1356cLNQdtLS+Pw4fR6xPmDx
         xBnJXFcHsyfdo7p7WLztYtX15whhFleOibxy3cQQtFTF3KX712QQYdJxpguI0+rPIIdc
         7YYw==
X-Forwarded-Encrypted: i=1; AL+hErGav7VP1Xo7SfX6BALwDWSEvc9eci4HIcJfYIYSd2bUAooSUGTqzt7VfkNJZyVS18hApTRitzXqESmqJQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Lzx/KSWBnPipjaJuw2K8xM9caWZZsE/UIpPhcYF5Wg+TnthS0
	kdNK+1kaOUbulkiD5RQOIn1VqMtTI4XVeh5i7rvGgFxQl0MD8rQsZO7wj5HuTpjWVrs6Q7qPJFz
	vjtwv5ujuIEVXkXmJz4qvyypK3ZjJDdJqx4aX8pDHRRpuaFKcJPLEy0K8Fx7T3up2gQ==
X-Gm-Gg: AZFdTZd8E3BOD41eip90ExRE3gLPDg6ZWsYeGSzfoLlE+2xIwF5nPU6njpyid5OOxYc
	oU7oEMEY6l98xRbMo4uHA37kRPZeph7Z1NSJGMMD1ACGB4F8BKko+Vg29BS5h/mKECbM6qhv8jo
	sxG0bWc0DgNco5/RRDrCvFv0xoPlEISb8ymU4c8WxAXwgPYMb9+YFajrR3kvJetximthP2Zrx//
	TS2rCaKdO9Lc83/oSkj4/dmPrBAMC0zA/yC3x6o+S2DL9J5sAoi6JMk8OG2XQagKEX7GpkvIoBX
	Vo1DG/oqNv4R2mghAGSVI9i5j3DINZMXw02UHXNfHLYGoGErGqyVvck/pkVGt1MAgvStwLHMWfP
	L84DQck6MKWTdqC93PAskd51on63tK0fJI3UBiB5X+0Q/VAd9nYKWrCz91dhUYDvs9CfFqjk=
X-Received: by 2002:a05:620a:a786:20b0:949:6e6a:e85c with SMTP id af79cd13be357-949ba997457mr3195147585a.4.1795603986593;
        Wed, 25 Nov 2026 02:53:06 -0800 (PST)
X-Received: by 2002:a05:620a:a786:20b0:949:6e6a:e85c with SMTP id af79cd13be357-949ba997457mr3195141985a.4.1795603986021;
        Wed, 25 Nov 2026 02:53:06 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85ecsm617587866b.70.2026.11.25.02.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:53:05 -0800 (PST)
Message-ID: <15cde6af-0b9f-4a0f-9d21-4e5ca9107a67@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:53:02 +0100
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
Subject: Re: [PATCH v5 3/3] phy: qcom-mipi-csi2: Add Hawi support
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
References: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
 <20261125-hawi-maili-camss-v5-3-1483b7f68dce@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-hawi-maili-camss-v5-3-1483b7f68dce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hxRCUVHSW2fxTrNOIe4Nl_Zr6stq-lIW
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06be13 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Olo7VrpVOdv4N-DtMm0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX0kWrxBbOeLYX
 YRdDH8gAHAuNr0dn5RYx1QAwOTDmtiLOIdkc09UwuvJetDYMF3xLKub6qpvAClIyPm4lvZqfK1j
 YBUUOtK+YBz0lG92MB9DuXNSrSSrzl0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX4JMGK12svKva
 7X0y7Fc8Hg9K9K7QJArm/YHE3k6lq6EFEV4kv/n2yC+dL5Yhg3cuswz65YzmMlLAo55utjhS934
 XFt+39JQxHD8LfQD6vwbYKgMWZPFFh0IlE4qdemOoh+tvXc2L2EpdjdnFAhh7S59wQwB6kwwcq4
 uR5tBYA1REmoeIosqRLqTxSs93cmmgrr95RGAt6V6wn2fUzc7qlBe6vqtSl5tvP0t6z3cCePBHt
 yashDg5O/tqYREMT/69GfTPcWEp35iCmoFCPhudESgXQJvL2U7DJEq5LXT/CIAMe3bD+75izd7J
 y5R/ks3umGUVDF9az5eyB4p4uKKT/GHI6pZZGtwnqGiKBn6RC2gWCU08VjgndLyYlCMRMeV+AHQ
 3kacXdz995BgJPE4bDlNWUYmUE6Ck+ujSozChR6iIivYy7pCYBa6k91oA5BNiD91iyFOfsi7CTs
 i3RCZ4moXjPhWYigYxA==
X-Proofpoint-ORIG-GUID: hxRCUVHSW2fxTrNOIe4Nl_Zr6stq-lIW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250043

On 11/25/26 7:25 AM, Nihal Kumar Gupta wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Add support for the Hawi 2nm CSI-2 D-PHY.
> 
> Reuse the Kaanapali lane table and adjust the data-lane CTRL0 value
> from 0x8e to 0x8c for Hawi-specific tuning. This prevents potential
> stream stalls and SMMU faults.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 136 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   1 +
>  3 files changed, 138 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index ed40934d67eaeba0c6ac7ac75324ac6292fe7d9e..5d91303e0df2e8c5bca3ea8fa2bb831429a8f1ff 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -162,6 +162,126 @@ mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
>  	{.reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
>  };
>  
> +/* 2nm 2PH 2p5Gbps 4 lane DPHY mode, Kaanapali table with data-lane CTRL0 0x8c */

nit: 2ph and DPHY are synonymous, if you rename the struct to something
like lane_regs_hawi_dphy, we no longer need this comment.

As for the override, if its meaning is well-known (the difference is bit1
being set or not), we can add some sort of a booelan override instead of
duplicating the table, maybe

Konrad
