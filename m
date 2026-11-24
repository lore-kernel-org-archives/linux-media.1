Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516151;
	b=SZkCc4WKUOUb+2XBBVCPQ4OMW5MsoLfVxw4uEpQioGVU0Lsh9I0uKUOCoWbU6gh0LpPn
	 kt9axNGa1JEUbsqv13e/EHAjlhmnN8AhwK+z4pO9BDqwRKMZhJtbWvs3eMvym0i25a6+c
	 vFq9DdqmFLEMmffeVP0MO127YRPakeP3VZFwND/srOwwlIFb4E3ODBblaWiuVe2QUxJFG
	 VNpdEdbnLAGsAJc7UOdkYggypPEaln7i8ybk3YVlTWiOSTGP5YEyWEgDknm/2TwzXdhUu
	 KWL5kMIBYrTv4IQGLoaO7WEp1z85ntSA5LiGhuncNW9eTTiTbRXXlTg7F/pOnq9DO0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516151;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aOv2fgqUlerdJXBxK5Hav3YXg2qfWPCdNx3AT5SzyIA=;
	b=uk5J/D/dkgpnFxGs4N+LxuEYTu87+0GQt2TI3Frf4uGFrNUFQL8KflNDeVkPNZ+ztl/W
	 r+hXv7jMXY1/QmfljOm+ei/YhHm97w4A0lHrdR4HA9nUAt18YQ7diZd1CkLPvsOxP6IKZ
	 dIN4bCuY+IhhzlYZ1cotVa7EoGTMQsoNW/gZIBplzr8UW20gZOMetvVB5qTpU1K1KJqUY
	 yQcpKxGLjVcF0qixueKtjmvj15LqP/534qk+x8fWwqNDEnSDwqs4ge+sP+1ZSxLYRg8kj
	 ZIkc1xZiciLOmiqD40tlZDy3s5TWqeBkgP6Fft/qAejd94e5XtMKhoAoLfRVFOgHCIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=upkM9S0X;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E9B606A31E;
	Tue, 24 Nov 2026 10:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2E9B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=upkM9S0X
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0720B339;
	Tue, 24 Nov 2026 02:29:07 -0800 (PST)
Received: from [10.2.201.43] (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 347AE3F882;
	Tue, 24 Nov 2026 02:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795516149; bh=t1CXYGXa18yf8H8Y9wwtgRJEfot9MoDcp1L7I+Ri5fw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=upkM9S0XTGU7pt5JgU7w+TZdVWDdW9ldNet5OFgOg02pz/ashDdZ9I9itcYCIdoCe
	 GwyqH5je5ozHWs1oaHktSKEm7/uFapHo1TN/MGVxucQ88JqqSaqjoPU5G5UMf7dhIj
	 6w5z9TljkYOY8bUz6NgxJ76YX1d+QaZSyCAcu/S0=
Message-ID: <5212782d-0474-4693-8a60-b4291e2a969e@arm.com>
Date: Tue, 24 Nov 2026 10:29:06 +0000
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
Subject: Re: [RFC PATCH 03/28] media: mali-vpu: register V4L2 decoder device
 and add querycap ioctl
To: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
 Shobhit Pandey <shobhit.pandey@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-4-charvi.mehta@arm.com>
 <91e8a132f2ddff24b30c244dff0a8389afa313fa.camel@ndufresne.ca>
Content-Language: en-US
From: Charvi Mehta <charvi.mehta@arm.com>
In-Reply-To: <91e8a132f2ddff24b30c244dff0a8389afa313fa.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/19/26 20:10, Nicolas Dufresne wrote:
>>   .../platform/arm/mali-vpu/mali-vpu-vidioc.c   | 78 +++++++++++++++++++
>>   .../platform/arm/mali-vpu/mali-vpu-vidioc.h   | 15 ++++
> nit: I'd say rename to mali-vpu-v4l2.c to be consistent with nearly all other
> drivers.
>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
The file also contains the V4L2 file operations and mem2mem callbacks,
so mali-vpu-v4l2.c would indeed better describe its scope. I’ll rename 
it in v2.
Thanks for the review.

Regards,
Charvi
