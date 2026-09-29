Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3143B42C5
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 09:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673405; cv=none; b=rwtbjQR7bWvJmccx35zdvhwbfmR25Q1y5IvgCJvLp3B0sUZEtyOYDcBFhasfq6qXDzSIaHF4KUQS+/VsKvMnCUYP2cNYLijFHWJ7nC7Pb6+OuhdcHB++B+3Fol+zf/2M3vu5slVr/apK/TREsudc0C9enLZpGoJQRnmpfUWq1R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673405; c=relaxed/simple;
	bh=0qkInmXjdeyOne4EnVuvT1Pj4BqEIh8rtNH9tKHi8NA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RI+/F8GhG7e0FjNJ/PGoSFW4wtqbjZ6UvfJMA55BTkt18FXfrV9Nh/fGDvxwCN3G3DSxiG8iWD9Pgq2bYgHsjunVxDcyEL4SnI9eWjU1JvnZe8wsspLs/Hce2Nb+NyndafOHsJYpcaGhRR3XzQcwhNZYPntHFnuNs9Saarcwxnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBVBakNp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBVBakNp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775F31F000FF;
	Tue, 29 Sep 2026 09:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790673394;
	bh=rGZeQTwpTKymAOo0ui6d/JWUb+TSAZoYhiJAa9OX/5Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RBVBakNpzjV2/vQsykhF49QYtLdPC/5ekhLxdid0uIGWYh8hQI1tJxmImeBPIuN4g
	 qE3wkb3OxUHNL6aft/mT2lGdJqkifevZ7DEG9LhUGWjNG2D0L3f2Hx/tiVteIvyzLw
	 FEztUT/zTlrsbFZDEWhFtybgMAasP1aqc+hM4Bhy61VKmNyiU7N18ER9IIn/C7Uwb0
	 QAei+VfFRUDYdhivo9MBQi5/3wD6Zu7l6HvViJB/6NMHheWT4xESffsgLDdc3Y/MoY
	 B3DTGOrXfkvaOSyKtqqoXsyQYmZv3q5zUnmiAPUwJAaeMOaS3ilMngFwGtkX1I7k+0
	 /SU3HHJOfPXnw==
Message-ID: <206c3a0e-013c-4350-aa70-eac96e045784@kernel.org>
Date: Tue, 29 Sep 2026 11:16:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: drop useless assignment in
 uvc_parse_format()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Sergey Shtylyov <s.shtylyov@auroraos.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20260820201128.35669-1-s.shtylyov@auroraos.dev>
 <CANiDSCuWc8oUhFgqVMH+4+nzStuPfA5b2Vz+2woXqEu6ob1yOA@mail.gmail.com>
 <20260928202948.GI4406@killaraus.ideasonboard.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260928202948.GI4406@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 28-Sep-26 22:29, Laurent Pinchart wrote:
> On Thu, Aug 27, 2026 at 11:24:33AM +0200, Ricardo Ribalda wrote:
>> Hi Sergey
>>
>> On Thu, 20 Aug 2026 at 22:12, Sergey Shtylyov <s.shtylyov@auroraos.dev> wrote:
>>>
>>> Close to the end of uvc_parse_format(), the parameter buflen is decremented
>>> (again) but that statement seems pointless as buflen isn't used afterwards.
>>> Drop the useless assignment (gcc doesn't generate any code for it anyways).
>>
>> The patch is correct, although I do not see a great benefit in
>> removing it. As you say, the compiler will remove it anyway. If we
>> modify the function to add logging or continue parsing the left over
>> buffer, it is going to come back to haunt us....
>>
>> I leave it to Laurent or HansG to decide if they want to merge it.
> 
> I'd rather keep the buflen update in place for the reasons explained by
> Ricardo.
> 
> /me wishes for std::span<> in C

Ack, I've dropped this patch from patchwork.

Regards,

Hans


> 
>>> Found by Linux Verification Center (linuxtesting.org) with the Svace static
>>> analysis tool.
>>>
>>> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
>>> ---
>>>  drivers/media/usb/uvc/uvc_driver.c | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>>> index e289cc71ba98..0e78e8bcd320 100644
>>> --- a/drivers/media/usb/uvc/uvc_driver.c
>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>>> @@ -520,7 +520,6 @@ static int uvc_parse_format(struct uvc_device *dev,
>>>                 format->xfer_func = uvc_xfer_func(buffer[4]);
>>>                 format->ycbcr_enc = uvc_ycbcr_enc(buffer[5]);
>>>
>>> -               buflen -= buffer[0];
>>>                 buffer += buffer[0];
>>>         } else {
>>>                 format->colorspace = V4L2_COLORSPACE_SRGB;
> 

