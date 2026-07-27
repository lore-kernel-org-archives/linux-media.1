Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4453E5EF8;
	Mon, 27 Jul 2026 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147295; cv=none; b=UNKwGwx0+K4VGKUaq4X3MF3yObYZTRO2QoMNyXdTsuhMy2snbkTrggnmFFtukWC5KCPv608c7Iy/MHEFhV2UViZzI8sbtdQ/FGEWxs9bg8o9xjbdATesJGzn8OfAeMQzVTqy/c/2z16L130P+C3rC2mRCPUIm7p7JbloXt6mSp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147295; c=relaxed/simple;
	bh=S7H5qPH5MOqFLdj/B6LgXQuPPbOPzmhvjr77jYsXqwk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RQ2Et+s6/p8CWPxP6p9CdF5XA7O4bYbMN0QJdqgBtwDbuVFZnGI2c39xsuW6PiFRF9UTf8c8d7eUBFiOcttKNnC/5HufYL/sJtJlStSsssgdcf47C6ANWrWjihsSFhtHZSeCN/2AOorU73cevWFcxDGPPfYnhxywV1ZY4zRjORE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+FqIR2L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+FqIR2L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DBF1F000E9;
	Mon, 27 Jul 2026 10:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785147294;
	bh=cnjyjbtdlX5Y8MtPTpaRj/mIy+eQi735BE9qC5b03DA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=h+FqIR2LqLHCQQxnUs16ys3re+DK/JPtU48OapIhRr82o+G6hdCOxKp0O9iD8/aua
	 JM8RZqpRtSVAEeXe+hMVC+HpsTCIaesDRkqgx1JT4pqT00A3QMa9MVLZ/f12blERIc
	 fnj6r7/MFi2LiSrB3rQ5d8c0pYvBz9xxc0Nd/YL4y9eLPejoG9kyDwDoYkpH5f6GvL
	 byWjK7IPmEDmXMduHthXCoXeoG3ITIo//ZtIvN0pB+PEEN4l4+BSRn8Md/Pshix28O
	 gEql3V38j6fmPod/XCWZXpOSWuulBgYHEZoJpz1woRN3owta4wXiI3h0dGo8qjXTaJ
	 HkGQ2dL3DoPTQ==
Message-ID: <68d1c273-bbca-49cc-a7f2-7fd6e868fbf4@kernel.org>
Date: Mon, 27 Jul 2026 12:14:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4 14/17] media: em28xx: Add include for struct
 usb_device_id
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
 <e72de5b4b9f1aa77a3c19a5e698a195dfd81ae0b.1782808461.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, nl
In-Reply-To: <e72de5b4b9f1aa77a3c19a5e698a195dfd81ae0b.1782808461.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/06/2026 11:24, Uwe Kleine-König (The Capable Hub) wrote:
> Traditionally <linux/mod_devicetable.h> was a header defining a plethora
> of structs, among them struct usb_device_id. This was split now with the
> objective that only the relevant bits are included.
> 
> Currently <linux/mod_devicetable.h> is transitively included in
> drivers/media/usb/em28xx/em28xx.h via:
> 
> 	drivers/media/usb/em28xx/em28xx.h ->
> 	<linux/i2c.h> ->
> 	<linux/acpi.h> ->
> 	<linux/device.h> ->
> 	<linux/device/driver.h> ->
> 	<linux/mod_devicetable.h
> 
> To keep struct usb_device_id available once <linux/device/driver.h>
> stops including <linux/mod_devicetable.h>, include it the header
> providing that struct explictly.
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Link: https://patch.msgid.link/b859817d9f6ec7450302a231e093a5ad5852cb91.1782682124.git.ukleinek@kernel.org
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  drivers/media/usb/em28xx/em28xx.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
> index 21c912403efc..711f281613f5 100644
> --- a/drivers/media/usb/em28xx/em28xx.h
> +++ b/drivers/media/usb/em28xx/em28xx.h
> @@ -23,6 +23,7 @@
>  #include <linux/mutex.h>
>  #include <linux/kref.h>
>  #include <linux/videodev2.h>
> +#include <linux/device-id/usb.h>
>  
>  #include <media/videobuf2-v4l2.h>
>  #include <media/videobuf2-vmalloc.h>

