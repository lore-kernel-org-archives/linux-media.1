Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8CC3F5BC0;
	Tue, 30 Jun 2026 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825602; cv=none; b=fIok0fWPCwy9ZhqNw3nKK5JqO8dn4VuPwRckdEa9iFxSs1TinfZVav/5vQCJALACUPOJqHsCx3EHK7nB/LL/Dw2KhbU2TNA4pzXjpWLul/yxdd6cQ6RSYZRMQJe3P5J2Oyxe/DxB/3iFso0InQKHG74mmaL8mXNqyUJ2tmUYszw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825602; c=relaxed/simple;
	bh=MBw1UUsDY5u5KuY7BNpPUIEttfDRQjlxBKUSNdUGDnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZgnzCZO5x55YOlzd79wpLUCkjYvCL4mZ+PJ4QxfJvzi06ukECTJqwIRvPa326lJyxxp1to08/UzCEf3TO1NsabHWgcVuKQ+7GSVqJkEBNn9pLDoLSDeGnvIP02HOajcnz7TNGJzEeSee4BbG0MSh05EOkmMfPGnNoB2WnYGYHig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370681F000E9;
	Tue, 30 Jun 2026 13:19:58 +0000 (UTC)
Message-ID: <fbc018f5-c025-4747-85f2-53b45b0f0496@nxsw.ie>
Date: Tue, 30 Jun 2026 14:19:56 +0100
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
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <569539db-b079-439a-bd05-cb97c30141c1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/06/2026 14:38, Vladimir Zapolskiy wrote:
>> +                interconnects =
>> +                    <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
>> +                    <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
>> +                    <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
>> +                    <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
>> +                interconnect-names = "cpu-cfg",
>> +                                     "hf-mnoc",
>> +                                     "sf-mnoc",
>> +                                     "icp-mnoc";
> Since the proper option for describing this hardware is to have it as
> a child device tree node of CAMSS device tree node, which should serve
> or be percepted as a bus, it makes no sense to repeat and moreover rename
> bus/parent's resources, here is the list:
> 
> * "hf_axi", "sf_axi", "core_ahb", "cpas_ahb" and "cnoc_axi" clocks,
> * Titan GDSC power domain and all four interconnects.
> 
> Only "jpeg" clock and iommus are left specific to the hardware description
> of this IP under CAMSS, right? Thus, it should be reflected like this in
> the dt description as well, and the complexity of shared resource management
> has to be done in the driver, which might be tedious unfortunately, but
> certainly doable.

JPEG should be able to vote for its individual NoC / CamNoC dependencies 
/ requirements.

Both GDSCs and interconnects should be described in the sub-node.

There's no functional linkage between CAMSS/IFE and JPEG - they are 
peers within the CAMSS power-island. Over time we will migrate to 
individual nodes for IFE CSID and these too will appear inside of the 
CAMSS "bus" -> JPEG etc should describe their nocs and power-domains 
individually.

camss@X{
	camnoc@{}
	csid@{
		interconnects = <gem_noc>, <cam_noc>;
	};
	jpeg@ {
		interconnects = <gem_noc>, <cam_noc>;
	};
	ife@ {
		interconnects = <gem_noc>, <cam_noc>;
	};
};

That's not where we are but its where we should be going.

---
bod
