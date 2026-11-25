Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614178;
	b=b5KaQ45cnnUG+HP2w50ykoJJ/AyJY8S2kIhnXol+vOCvFTVpVjshScZPILSb9aUBiGeV
	 7GLyq1pKhcnY2SPDt2ji9qkNeBHxwA1p0Ka34KIMxfjpPETpwqPNXsXatQ1MrdmLmOEzP
	 Tk7i1zqAmaFkxcQVHOdH0XNq4011AFx0+t/+sEvq8/fsoFw0al4FzgksDLZlT7ZInCins
	 pyThRmkZRFWZ84c352GCWYT1X7p1VF1NZ2h8s0LVsDoyAMjsqgTwPR/fwEAFO4wdHV8Fo
	 dd+y69qWgNH379jfHBccfOXKxQ+nKTMvrf2zbDFRpKA8BFBizbtMpsm96HyYZnNc7vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614178;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=94dBN4nZvz5K10Z7Qo1dDIzvMLLzg6fHXCl3rR87xXY=;
	b=lef4DS6WF2iUYG/bX1tcpNsr00jDO7aSLHTn7h9MTECTQQ/+4ktJangW5o3jZkphXd/k
	 u4PX7rzuJG3Wf7IKX7bex2ZFWCDoFn6nHNwM3ligY/O2vJEUF7Aymk7r9AocJCrEn+Waa
	 LoAH+Z+c0WxUdA7kzZJCEnkX1Y5N5/jtXg63s1Sh7fgenJWDDSW1zHJHIuZLMGcdzXgXk
	 JGY3I5pQQ2Ojj1itUWNZvfWGhnlGCEu7vbvB1O7DnlJGGiMcz2nYG+TIxo5OPNUm94Lzr
	 iKQGlxeBJE1LTuHbLhBIC8j12KjcG6M1fp4te4oXL66G1kQh5QTCNak7eF/QqIM0DWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YPiVF8ZR;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD61606A321;
	Wed, 25 Nov 2026 13:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD61606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YPiVF8ZR
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 976C52F;
	Wed, 25 Nov 2026 05:42:53 -0800 (PST)
Received: from [10.2.201.43] (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAD333F86F;
	Wed, 25 Nov 2026 05:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795614176; bh=AxfncaFQ0kh4IU5ZveyAnWcDrnSS3uLL80mDJJw2xIk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YPiVF8ZRRPQKPaa9SH+gqmtoz8+gCL8DOq/QMmfQjL+1u6VNmkZobG/pLQNX+ZnH+
	 prgpb7+SyN5LwjvQxYqzndoPdTZ4ejRPdtfvZGAiGuCJAo45azE86Fpwgw90Pv+aJB
	 CXbJXc+zOphgmQXGn/04YL8t/bFZrtppdVZjQ7to=
Message-ID: <c6b27e99-bbd9-4dcd-ae35-3c31222475f5@arm.com>
Date: Wed, 25 Nov 2026 13:42:53 +0000
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
Subject: Re: [RFC PATCH 10/28] media: mali-vpu: add firmware cache
 infrastructure
To: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
 Shobhit Pandey <shobhit.pandey@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-11-charvi.mehta@arm.com>
 <0fe8752a8e772928ed9c86b022b4770a5c65a05f.camel@ndufresne.ca>
Content-Language: en-US
From: Charvi Mehta <charvi.mehta@arm.com>
In-Reply-To: <0fe8752a8e772928ed9c86b022b4770a5c65a05f.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/19/26 21:34, Nicolas Dufresne wrote:
>> +	n = snprintf(name, name_sz, "arm/mali-vpu/v%u/%s%s.fwb",
>> +		     key->fw_ver_major, codec, role_str);
> Your firmware will have to be published into linux-firmware project for your
> driver to be accepted upstream. Depending on the state, feedback and clarity of
> your driver, I may or may not ask to ship some HW to verify your work. No
> immediate action needed. Since you only offered a generic DT binding, its not
> clear what upstream SoC can actually make use of this driver. Some information
> about this would be appreciated in your next cover letter.
I am in the process of submitting the H.264 decoder firmware blob to 
linux-firmware.
Testing is currently supported on FPGA platforms and software simulation 
models.
A possible SoC integration of a related variant is also being verified. 
This work lays the
groundwork for the next generation of the IP, which is intended for SoC 
integration and
is expected to reuse most of the driver with minor variant-specific changes.

Regards,
Charvi
