Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367E138C2D0
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 05:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438753; cv=none; b=HshmJhSwXy70qhgxR2tIzInJDsCmQPlYExYGbXa59xl3QBEJy6LgYDwSHiLQbirowCqOA+9U24sixN5eeysRJ5reJBF8KDjN+C/OVAJkdFGoPKf/ow4xjwpl30dO9nGLTtmPQurIIBkZwPyeXXXvsjszS67S56eCWLbKzXC5+VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438753; c=relaxed/simple;
	bh=Uk460tCeaBsvnwr6hFJjy+4DyVahTBOsGXJc5SDSfiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrZzgXkBFyrbYAGSVrSBKZ0c9AsRBQZO2yrEBTpIBP9kJHeUf/rvvSoZrTXQIe2hzgkFeKJwap3eGzhUbkgOiyQ9B8+NNZKjua+kom5fNDvjNlvuEXcQvgBPSsIQDajIQaF2EOtHvDBLpQ5WHSE/PCpAtBipz4/GCXZrAjAINiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mccORTXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f81qrD5q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mccORTXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f81qrD5q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BjoU1654523
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 05:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nl/ebYpCxWS1VsQEQ0bG8m+LAAelmFykJoODQwZgW54=; b=mccORTXIDNT2ZsUB
	FQpsxPjnUmj4Jj3/LHWBjuNvxp5A1UimGevn6T5IFTV1flyg21GRbxUvVGlWYsb4
	I9AF+VWj/trumaJol5kRQiZ36lIQ+/0U671OyWZj1li0KRT2pTjDsTtYktoqRSfB
	gBsnQ206xzC0YuWjvv9o6WrFmVAF1mIiF2x62ZaHqZnG+8b0K+vZpRvKgr9E4LAK
	0mcrmLJmjvMY/d0fGThNV3v+xiTFvYxmsXtkT1BOksTDvugWZg4wNRB6Y4r/QM5g
	NMSx9WURBkecgicWWsE+QyFkwybB4ApiG1M+DC7m96Yt7XdexDc9KkQ/nQU73s1V
	Z0TijQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3hb47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 05:52:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso794384485a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 22:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791438750; x=1792043550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nl/ebYpCxWS1VsQEQ0bG8m+LAAelmFykJoODQwZgW54=;
        b=f81qrD5qkExPUxszjTFcUCz9P8asSwudGPQHyzGYHFnKlPM3L9HKPTpYP3CVOqsbtK
         nM9ud7MK2jsKWTOkHB7B9ZVihkWgJ53qqorluf8nbHbaRVa6Ef4IXP5ZgWahvC50KmRI
         oByt0LVGX2Ao4PT6JNFuaZ22+nty+sPm/9lvptuicC00IoXHssqYZx+klflVYSo/s4kR
         rZHj3yJ09UhB07RlQMvqs0+omuP6R/n5fpTTouC2raxdGjQyvx0h9CupKzGZWwSp3/vs
         J0AsapmJjUpRPs40WlawrV1nh6z5oJfQuBzULw9SR+BbyhuGs6OYdE2UJE4atHXEpEEv
         n6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791438750; x=1792043550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nl/ebYpCxWS1VsQEQ0bG8m+LAAelmFykJoODQwZgW54=;
        b=dH32D3+kLFRxbyysWJ+DH9HPF8aROEYwttAwrZcrEo1jkbSqT7esFr7OZkB1O1la1u
         2hGJaIufO3CmjQEC9I4rIX4lPDsU2NLDA5QagOKSi/tFIZ6ts1RWA+C4PLv4unZ7VQyJ
         yo0quZPvEXMNJxpkfYENgj3uhKVptWAp9AII/Eu2cbw12qgA9HA/7blSxZ0keAmQDjVI
         HP2eiLJhrKq+iFapRy0UvwI2Y3CaJY2gJlCtJiMZFUJJBeXeW8EYaHj9PmCaGJzmKoHc
         qcCzogRxce+XYi1lCmJ1Iwl2/zu2YbNxhJ0vjBet+2lO3OB0FxN2uxuv+01Q4RGW6aDh
         bi2Q==
X-Gm-Message-State: AFuF++mphdtJETw4U5r4pQbJt2FoR4hIcJZfVXaJY3k3kO3TRGplrLQj
	4abtgHe6j34u80WEwXdixkR6RJavGYFjcaRCgDv36bh2iqU+f9mnz3lNdd1Yz6DqK3HDLF2ew0I
	yQMoE6r+q5VpUbckxAPdEFqCYcWsVRN/vIFPVw9jpb/ie7oJw0fdLDK3DWeJeV/TMmA==
X-Gm-Gg: AYBFou1O/41fbosbrig0df7NGQLAX387agbRLFNGpATFPq4vko7rzZ6Y0F6ygRfy3XD
	hAH1uF6uFgwNo8Huq+mlqiscc/CCtNklyutv3R7u0ikmUoImCBcWeLDXJqLrfyb7UUj2dhWrvY2
	+MaSQ32OHCjC6rm39xldHEVnq2CnE3ZyNfxkp3m4KCjEkV4C9LFkztbj+FNqodTXNSM2tLU8D7x
	ywhGc+6GO6kV18Y2Dg1BFO6s3GmgLHM+WRoJmZYLRg5XmWE4hzfTRMLZMNA9H3kmYiMvhgnyf52
	MklU2zJm6hSMlVqv68qmRToYmvfrVvMbtUoqDNw54/qGCDBD6FYovN6MFtmKdM2Gpm/D1xzz22v
	5ZWyGVt0254bAJIzsmnG3Q54JotZHLebzEkFCQ9g=
X-Received: by 2002:a05:620a:198d:b0:93b:d79b:9a54 with SMTP id af79cd13be357-93e9b79f90dmr851202285a.53.1791438750478;
        Wed, 07 Oct 2026 22:52:30 -0700 (PDT)
X-Received: by 2002:a05:620a:198d:b0:93b:d79b:9a54 with SMTP id af79cd13be357-93e9b79f90dmr851199185a.53.1791438749947;
        Wed, 07 Oct 2026 22:52:29 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1ffbcsm8841922f8f.36.2026.10.07.22.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 22:52:29 -0700 (PDT)
Message-ID: <644dfb83-4543-4615-8300-165b40e222ea@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 08:52:26 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/74] media: qcom: camss: vfe: Define vfe v3 completion
 group enum
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-24-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-24-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac72f9f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=V_ISnGxoR7IPBYvKj00A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfX2I4GUsJb4sQ6
 4dN8KGhYPviV9eum9j2hyvpyCPv4miEdCRIDoTvQwQ5ZWWMFbOh32rlN4pBi2BqDwguav3Qch2x
 IWpP+i2YUcCI1aiZoKsCQLYvoYG2Tkg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfX7dXRjc/7pzm3
 gS8YQ9/0hQgMD1yOqT8HFf0Zl+rRHG1A9+7gxH4zbuxkgxIIsJRRe+Xhl2WtaOd0LIF0TAVdCaq
 lfE11TIHqtDdPd7r+qFJtL8qTXcsnk5Tf6c2tiLSv4ukXBnTzxLoxJ964Gy2Scp8Q0mnxklr0Od
 6SYMg2tCCriLTVaOYkCTi8AKSmo/sMCYmgerHzfJKDB/nhG0digzgxPNyyVKr6L46ezdGzxONDt
 d9L+bnVMtS22NjiHtNadk7wfDsVEBXSlYvHDkqeGr6Y2JS6X8vFhx4KAV86ZL+Dq9n+06UPDgON
 G1pEO8Ak9YoZ9hdG1DW9m4JgDhPXZERpNc+ecQ+2fOVOIgw/MSxKbBhHQtlXAvhAhdYRa/Advvo
 hsRCXjOZT9qamaBqbETAyPZ54kIzULpT4h5NxLSfbtYRAq+Cz22UmKwwLfudwB3kCjvXEHz4VmY
 pK+dd4LnUOCddUAR4+A==
X-Proofpoint-ORIG-GUID: 16HtwqVUToE3rZYT0eOEVNqtAw9tqkFT
X-Proofpoint-GUID: 16HtwqVUToE3rZYT0eOEVNqtAw9tqkFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080023

Hi Bryan, 

On 10/5/2026 8:13 PM, Bryan O'Donoghue wrote:
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 925b0e59f9605..6ba0d0c7d6be2 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -78,6 +78,27 @@ enum vfe_packer_format_v3 {
>  	VFE_BUS_WM_PACKER_FMT_V3_MAX,
>  };
>  
> +enum vfe_v3_comp_group {
> +	VFE_V3_COMP_GRP_0,
> +	VFE_V3_COMP_GRP_1,
> +	VFE_V3_COMP_GRP_2,
> +	VFE_V3_COMP_GRP_3,
> +	VFE_V3_COMP_GRP_4,
> +	VFE_V3_COMP_GRP_5,
> +	VFE_V3_COMP_GRP_6,
> +	VFE_V3_COMP_GRP_7,
> +	VFE_V3_COMP_GRP_8,
> +	VFE_V3_COMP_GRP_9,
> +	VFE_V3_COMP_GRP_10,
> +	VFE_V3_COMP_GRP_11,
> +	VFE_V3_COMP_GRP_12,
> +	VFE_V3_COMP_GRP_13,
> +	VFE_V3_COMP_GRP_14,
> +	VFE_V3_COMP_GRP_15,
> +	VFE_V3_COMP_GRP_16,
> +	VFE_V3_COMP_GRP_MAX,

Can we use numbers i dont see reason to have enum with _0, _1
but it is matter of taste maybe.

> +};
> +
>  struct vfe_wm {
>  	u8 bus_client;
>  };

Can we get at least what this bus_cleant means as comment to the structure or commit message?

~Gjorgji
