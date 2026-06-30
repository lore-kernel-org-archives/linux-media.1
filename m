Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AAE364EB0;
	Tue, 30 Jun 2026 20:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782851090; cv=none; b=qOjQa4rdZOa9frK04sRq8yr6Wml91c/HQcCOMJGbhWGv28mphFbJwp1I7optRtDvTb3+LWI/85X5KsOSPy2eBk7G9hOMbYiRRmfICMaDR2VqzspGPMdrLFeiHriWkrwm/bFza91R1Od3jze0GJ+5bBBVaGOZiqk24cIU1goiDbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782851090; c=relaxed/simple;
	bh=QjzGeGn2v3vp9cZJ6THBq4bWtJ/VoJClOZkMvZ8MTzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dx7vccxDE302aS7E2YuPCoHZ7yMhHAIUA7shZ38qXBVMZ0i9A7qOrL5EJiWZTtv50oG7PIdQZyOBTNeGd5RwNHeo7VGOKr9jWLnZpsrxVKuk5/u5BlKxWSP8b1Z3VcvAndTDBpCLUDJQGGrdDw1ey+9nZwExBQhWoXy9NL3dCl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6747B1F000E9;
	Tue, 30 Jun 2026 20:24:46 +0000 (UTC)
Message-ID: <257f9f48-4831-4f36-84c0-f7e6c257dd3a@nxsw.ie>
Date: Tue, 30 Jun 2026 21:24:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: media: qcom: Add JPEG encoder binding
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
 <_zZ7OLAmvphzTdIURTW71m_LKDwA-DEQ-a40gIiLYSqgDrdOOEf1bElz53zTbmSaDoqc8PDFyQXa7bycFaSTXw==@protonmail.internalid>
 <569539db-b079-439a-bd05-cb97c30141c1@linaro.org>
 <fbc018f5-c025-4747-85f2-53b45b0f0496@nxsw.ie>
 <IDwf-TUUNejblXqaFbAmpHIv49qp0PH0KB_H5HGcm1Wlj5zYf-q8Sota7H77GgDFcvhI2RHMCYmKRaDn0Q09fg==@protonmail.internalid>
 <0161b69d-62fb-46b8-a43a-df0c8af4956a@linaro.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <0161b69d-62fb-46b8-a43a-df0c8af4956a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/06/2026 14:32, Vladimir Zapolskiy wrote:
> On 6/30/26 16:19, Bryan O'Donoghue wrote:
>> On 29/06/2026 14:38, Vladimir Zapolskiy wrote:
>>>> +                interconnects =
>>>> +                    <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
>>>> +                    <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
>>>> +                    <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
>>>> +                    <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
>>>> +                interconnect-names = "cpu-cfg",
>>>> +                                     "hf-mnoc",
>>>> +                                     "sf-mnoc",
>>>> +                                     "icp-mnoc";
>>> Since the proper option for describing this hardware is to have it as
>>> a child device tree node of CAMSS device tree node, which should serve
>>> or be percepted as a bus, it makes no sense to repeat and moreover rename
>>> bus/parent's resources, here is the list:
>>>
>>> * "hf_axi", "sf_axi", "core_ahb", "cpas_ahb" and "cnoc_axi" clocks,
>>> * Titan GDSC power domain and all four interconnects.
>>>
>>> Only "jpeg" clock and iommus are left specific to the hardware description
>>> of this IP under CAMSS, right? Thus, it should be reflected like this in
>>> the dt description as well, and the complexity of shared resource management
>>> has to be done in the driver, which might be tedious unfortunately, but
>>> certainly doable.
>>
>> JPEG should be able to vote for its individual NoC / CamNoC dependencies
>> / requirements.
> 
> There is no individual interconnects, JPEG interconnects are equal to
> bus/parent CAMSS ones.

Not true.

As a matter of fact, the JPEG encoder has no use-case for the ICP MNOC, 
now that I look at this again.

Even if the list is identical the clocks, bandwidth, opp tables 
represent individual consumers with individual votes.
>>
>> Both GDSCs and interconnects should be described in the sub-node.
> 
> Why to do it in each child, if GDSCs and interconnects are CAMSS bus/domain
> specific? There is no acceptable explanation so far.

As we've already established some of the power-domains are function 
specific - for example MXA in the PHYs.

>> There's no functional linkage between CAMSS/IFE and JPEG - they are
>> peers within the CAMSS power-island. Over time we will migrate to
> 
> I do not refer to any "functional linkage".
> 
>> individual nodes for IFE CSID and these too will appear inside of the
>> CAMSS "bus" -> JPEG etc should describe their nocs and power-domains
>> individually.
>>
>> camss@X{
>> 	camnoc@{}
>> 	csid@{
>> 		interconnects = <gem_noc>, <cam_noc>;
>> 	};
>> 	jpeg@ {
>> 		interconnects = <gem_noc>, <cam_noc>;
>> 	};
>> 	ife@ {
>> 		interconnects = <gem_noc>, <cam_noc>;
>> 	};
>> };
> 
> It makes sense only if the lists of interconnects are different, this
> is not the case.
> 
> --
> Best wishes,
> Vladimir

