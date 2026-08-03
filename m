Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1EF1E5B64;
	Mon,  3 Aug 2026 06:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737780; cv=none; b=pJ33NJNY+a9LezrmGYcdQKq221doz8FxZTsovAEw1Lx4jzc/x+VQtCmEKdeBsMPkDl+FFg0unhG+UX1/hw5MLJp3jm22L0ZWAatuMD5QHNHp/23VoS1kigfmEccBrLUB77PJ5WL5ecdN3Qyk9K7cerG3tSWg17S9SbAAfNJ3qkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737780; c=relaxed/simple;
	bh=BopCKBvc+/vOh9lupetCn5dslWB7Kn8V1y64Lq8Q8c4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dffcDJR1sgjR4xt2nHOSymI0FrB8GRE58RguTrmei9yv7qRx2F1vw9im1mSqMcrL2faZS7uqrSLyTDE+rp91c1Tzk5dXhwgR0Vk+WfojTZReARmy0Fzmq/CMa9qoMfbwots3UrNJhCPxPH8KyVYECGcZWp9Wr05S8N7urBhM8XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=he3OujF5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="he3OujF5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066EB1F000E9;
	Mon,  3 Aug 2026 06:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785737778;
	bh=Nwv0Hx1KpfpKSMl7HZwvOlDpe7huQxwS54Hy0Bu6Xtg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=he3OujF57SGehO/1Ovm0njDqlsAnrER2BK1WAKOVqjjlSF5a9cdtoB6SWzR5c3Gzx
	 usGVF6YPrWWJGtpDbhkxuiYBLfyPcDfRzaNNhFoZi8er5vtvG6Okg2B+Ommly1/e+V
	 ZJBE7gd/2+7cE1G1hCyDGUQm2eXr9VUCuk9ZCetU6LzWSnJPn76bE7LnAevJF9TY6a
	 NAXPufU9qOq0LxIpD54W68RmGD/dcU7SyYAqbnYhAmy25+CXM+hlbLnCIMSNbtXzGl
	 X8YqeATImm2TlNmLVB42Jfo0VmBsA2u64QnFL64Z9LoHS5e8r68Np40ZRh2QTNDbHE
	 dDMSKHUE68f1w==
Message-ID: <a4d585fa-ccdc-4021-b7f7-f88638a9dbe4@kernel.org>
Date: Mon, 3 Aug 2026 08:16:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
 bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lachlan Michael <lachlan.michael@sony.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil+cisco@kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, kieran.bingham@ideasonboard.com,
 jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com,
 Kengo.Hayasaka@sony.com, Tim.Bird@sony.com, Kazumi.A.Sato@sony.com,
 linux-kernel@vger.kernel.org
References: <20260730021525.166811-1-lachlan.michael@sony.com>
 <20260730021525.166811-2-lachlan.michael@sony.com>
 <20260730-elastic-amaranth-urchin-4b8bbf@quoll>
 <20260802230344.GD1927055@killaraus.ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260802230344.GD1927055@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/08/2026 01:03, Laurent Pinchart wrote:
> On Thu, Jul 30, 2026 at 11:06:09AM +0200, Krzysztof Kozlowski wrote:
>> On Thu, Jul 30, 2026 at 11:15:24AM +0900, Lachlan Michael wrote:
>>> The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
>>> with a MIPI CSI-2 output interface.
>>>
>>> Add device tree bindings for the sensor.
>>>
>>> Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
>>
>> You need to test code before you send it, not with our infra.
> 
> I have provided guidance to Lachlan on how to test DT bindings (and have
> submitted a fix to dt-schema as part of that work) before he submitted
> this patch series. Unfortunately, we missed an issue in the
> configuration of his development environment which resulted in the DT
> bindings check not being run. Mistakes happen, it will work better next
> time :-)
> 
>> To spare you one sending cycle:
>>
>> A nit, subject: drop second/last, redundant "bindings". The
>> "dt-bindings" prefix is already stating that these are bindings.
>> See also:
>> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
>>
>>> ---
>>>  .../bindings/media/i2c/sony,imx908.yaml       | 107 ++++++++++++++++++
>>>  MAINTAINERS                                   |   7 ++
>>>  2 files changed, 114 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
>>
>> ...
>>
>>> +++ b/MAINTAINERS
>>> @@ -25264,6 +25264,13 @@ T:	git git://linuxtv.org/media.git
>>>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>>>  F:	drivers/media/i2c/imx415.c
>>>  
>>> +SONY IMX908 SENSOR DRIVER
>>> +M:	Lachlan Michael <lachlan.michael@sony.com>
>>> +L:	linux-media@vger.kernel.org
>>
>> Drop
> 
> Why so ?

It's just redundant and bloat. The address will ALWAYS appear through
the subsystem maintainers entry, thus duplicating exactly the same list
is not necessary. Many drivers make the same mistake (I fixed Samsung
now) resulting in quite big amount of redundant data.

Best regards,
Krzysztof
