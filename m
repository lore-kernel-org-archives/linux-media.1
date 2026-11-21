Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266732;
	b=kvUvlAaU0F7AdGQSImrt+GumCEz5SrLBCyekOhYx6XE4NaTetjmlxP788ddwv6GlB4Wu
	 HIaiwdkWokm1Q04klZdPfoI/Xg9HeGuBidRstBjBnobk8r/nupFPMAY686YHR1WPM5QCN
	 LuBrpF89fAyoGJR+M0UbdN9auuowBya/n38qzLk0yKhhJBqrs90BPImrOl2qS2IHINb7C
	 sub+rq4VAeeHrLiI52WqeLbcms01uDay0ojl+fbJN7PyOe5C3XTiUhRx6AEVCiZoLMBgc
	 D79mJVjtd/syseYuFEMjmdg0ur5dzcuwpGZW7JChT4KRnEHtqGYBwzNf0dqhjorS9kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266732;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=DL3+uXTpmmOZ+eFU2EbIBqbznty7fMOIe07P6uKnuow=;
	b=Sl0/rbWfkDkG6oECHcdrS9ap1r5VBMgg1UyXTAuyTBeN5XL+zQ/AvuoKC4dBQ2+e2uSj
	 sIqUFihPlYLIZAo8hYA+Maz0WwAWXShbHimG5AZcN0bv9hjV3lUCuVW0Dvt0hsyHb0UIz
	 8M1GRiLkw9L0M/BtPkJxFIRMSfzDWz58YG624QvZu+nIzvk9FNgEF+265VcaVVmgxmTzz
	 GksNcqnPm6BrCHlRsocOOqK9z9FPjABE7LYhzsxspU2JAegZEOCO88tBHxycrlxY4PgS7
	 1t+MQ2p1jiFgETuSfe4f2WmTC8ccAmciR9bfHre2bNiT6mWpUCQ1SnZNu6F9B89zRCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FPWMCT7l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7598F606A320;
	Sat, 21 Nov 2026 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FPWMCT7l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C221F000C4;
	Sat, 21 Nov 2026 13:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795266732;
	bh=DL3+uXTpmmOZ+eFU2EbIBqbznty7fMOIe07P6uKnuow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FPWMCT7lqV4WfTCXR9cR7k9HumG1WbgX7+l7Rif1pJwo77OP+v1yXbt/Sqjrme0+2
	 9RMbEGWaEOwuBtRwWM5bTEniUSmwUu635HfDYLmObt3NSKJ+D46wopvh4geoI5IJGM
	 zrNdBFk7zJq1GBpEihUl3j9jzntMavxuaJpmCdq60n/vtW8REVhBP72iOQ8EIQU0X/
	 DNCmyC+w2k9fH6V7t9HLCzCxAt47JB1iZmYj5wrNaqhwlDXPA4BNqs5Y3ZNBNjGmDL
	 LDxlonuM6sMlHQf6KOs1QOyegkqZ1+2/JLCCmgM+EduNOUF/yRIq4Iw0R3/ZHPyePL
	 EsJkWl3Wr/i7w==
Message-ID: <2c21c753-9acc-4111-99d1-a5e686f35f6d@kernel.org>
Date: Sat, 21 Nov 2026 14:12:01 +0100
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
Subject: Re: [PATCH v5 1/5] media: dt-bindings: rockchip: Add RK3568 Video
 Decoder bindings
To: Daniel Golle <daniel@makrotopia.org>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 David Heidelberg <david@ixit.cz>,
 Christian Hewitt <christianshewitt@gmail.com>, Marc Zyngier
 <maz@kernel.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Dang Huynh <dang.huynh@mainlining.org>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
References: <cover.1795191822.git.daniel@makrotopia.org>
 <70b950c4b4fefbe07fe081f780ff359ed697d37f.1795191822.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <70b950c4b4fefbe07fe081f780ff359ed697d37f.1795191822.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/11/2026 18:40, Daniel Golle wrote:
> From: Christian Hewitt <christianshewitt@gmail.com>
> 
> The video decoder in RK356X (vdpu346) is described in the same way as
> the one in RK3588 (vdpu381). A new compatible is added as the decoder
> capabilities are a subset of the vdpu381 capabilities.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com> # PineTab2, Quartz64-A, NanoPi R5S

You just ignored my feedback.

NAK

Best regards,
Krzysztof
