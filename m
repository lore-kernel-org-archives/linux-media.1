Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3E83D7D8E;
	Thu,  6 Aug 2026 06:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785997082; cv=none; b=R7bT5j1yVOEpG/9PH1u/Xxqf81aXRv4VSZQWLEoCrlzPD2MAxSWe0cLa9BwLNKhPEHB8xqLyHVlM5E6xBNlYIE5TZ+u/YMsypkY6S8U+XkceHjoB3nKcKuZ3pCB6VknErIm2Luj7zxOfApjyG96a34mVgWqCZbt5TxInScTIXjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785997082; c=relaxed/simple;
	bh=b3oH4EnVH/fEpZUTu8sRUA0eOJ74tPvBn6Iurbidoq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tn0q5wfUwiiQyCv/DBL60ZaWMDQwGSbSGq8MiY3K07dE3SEBTWx64KDWquLq2t+5xZ+MtLKqyjp3TlbEZITfkepCxpyX7C07eiAEOlNw+klCmWE5qjd/5x75WcaGDQ26DHrReeNef/j5zZBVmZYcsLirDyB+kTfsvzey+s2s3Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBjMox9w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBjMox9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1B71F000E9;
	Thu,  6 Aug 2026 06:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785997080;
	bh=bCm9YQNI7mX5+Rin2K/sJ26u1k6EhHibuUbkTDG8E40=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JBjMox9w3OfQ/iKr+5yZs+2ttEWzHk0Hz4W5OByKKb7K4O9DJR0s9RwlwDwjpOeIA
	 lLk7j5G7tym6YX0oF9FZtSWeQSk79e7qFzBQw7uTlWqFJGKVjtoyOSAKhCrjHFcYlV
	 vbjeGkjM1u2rMwRWDzZUdh+D8IidGVjmllCjspY4JoNURF3PT6sj4QS6YBNkBjDvR2
	 AWzH3OvQFHmTpgXbXeW0+vNSuyAbxaxAwzSfwRCimf2pqYdwyXKRUbEm44o58qHAJ7
	 EZ9dyamn8UZaSWgs+zLWwWfaqIAGyOiCbk0XjJIH8OYqDqa822prfUdeA9MFlIXxX3
	 +hevSZPxc1nVQ==
Message-ID: <73b5d300-1b0a-4ae3-9f3e-437559583563@kernel.org>
Date: Thu, 6 Aug 2026 09:17:54 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: bcm2835-unicam: Fix log status runtime access
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eugen Hristev <ehristev@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20260611-bcmpipm-v3-1-c609dacb029f@kernel.org>
 <20260611080348.GC1758601@killaraus.ideasonboard.com>
 <3b142d52-53d1-4942-bb45-1cb9645c164b@kernel.org>
 <20260611173407.GA1910728@killaraus.ideasonboard.com>
From: Eugen Hristev <ehristev@kernel.org>
Content-Language: en-US
In-Reply-To: <20260611173407.GA1910728@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/26 20:34, Laurent Pinchart wrote:
> On Thu, Jun 11, 2026 at 08:18:10PM +0300, Eugen Hristev wrote:
>> On 6/11/26 11:03, Laurent Pinchart wrote:
>>> On Thu, Jun 11, 2026 at 08:29:55AM +0300, Eugen Hristev wrote:
>>>> When requesting log status, the block might be powered off, but registers
>>>> are being read.
>>>> Avoid reading the registers if the device is not resumed, thus also avoid
>>>> powering up the device just for log status.
>>>>
>>>> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
>>>> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
>>>> ---
>>>> Changes in v3:
>>>> - Changed to check return value of pm_runtime_get_if_active() and only call
>>>>   pm_runtime_put() if the device is active.
>>>> - Link to v2: https://patch.msgid.link/20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org
>>>>
>>>> Changes in v2:
>>>> - changed to use pm_runtime_get_if_active()
>>>> - add corresponding put()
>>>> - Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d88045@kernel.org
>>>>
>>>> To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
>>>> To: Mauro Carvalho Chehab <mchehab@kernel.org>
>>>> To: Florian Fainelli <florian.fainelli@broadcom.com>
>>>> To: Ray Jui <rjui@broadcom.com>
>>>> To: Scott Branden <sbranden@broadcom.com>
>>>> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
>>>> To: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>> To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>>>> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> To: Hans Verkuil <hverkuil@kernel.org>
>>>> To: Naushir Patuck <naush@raspberrypi.com>
>>>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>> Cc: linux-media@vger.kernel.org
>>>> Cc: linux-rpi-kernel@lists.infradead.org
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> Cc: linux-kernel@vger.kernel.org
>>>> ---
>>>>  drivers/media/platform/broadcom/bcm2835-unicam.c | 12 ++++++++++++
>>>>  1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
>>>> index 8d28ba0b59a3..96b51e29bba4 100644
>>>> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
>>>> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
>>>> @@ -2043,6 +2043,7 @@ static int unicam_log_status(struct file *file, void *fh)
>>>>  	struct unicam_node *node = video_drvdata(file);
>>>>  	struct unicam_device *unicam = node->dev;
>>>>  	u32 reg;
>>>> +	int pm_active;
>>>>  
>>>>  	/* status for sub devices */
>>>>  	v4l2_device_call_all(&unicam->v4l2_dev, 0, core, log_status);
>>>> @@ -2052,6 +2053,14 @@ static int unicam_log_status(struct file *file, void *fh)
>>>>  		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
>>>>  	dev_info(unicam->dev, "V4L2 format:         %08x\n",
>>>>  		 node->fmt.fmt.pix.pixelformat);
>>>> +
>>>> +	pm_active = pm_runtime_get_if_active(unicam->dev);
>>>> +	if (!pm_active) {
>>>> +		dev_info(unicam->dev,
>>>> +			 "Live data N/A due to device inactive\n");
>>>> +		return 0;
>>>> +	}
>>>> +
>>>>  	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
>>>>  	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
>>>>  		 unicam_get_field(reg, UNICAM_PUM_MASK),
>>>> @@ -2065,6 +2074,9 @@ static int unicam_log_status(struct file *file, void *fh)
>>>>  	dev_info(unicam->dev, "Write pointer:       %08x\n",
>>>>  		 unicam_reg_read(unicam, UNICAM_IBWP));
>>>>  
>>>> +	if (pm_active == 1)
>>>> +		pm_runtime_put(unicam->dev);
>>>
>>> As far as I understand, the discussion on v2 concluded there was no need
>>> to test pm_active here. Did I miss anything ?
>>
>> Sorry, I saw the message from Sakari and he was pretty confident on the
>> right way, he even mentioned that all sensors should be fixed, and has
>> not come up with a follow up since.
>> If v2 is the right way, please disregard this v3
> 
> Let's see what Sakari has to say :-)

Hi Sakari,

Could you please let me know whether this v3 is the way you want this to
move forward ?
I have some pending things on top of this. If something is not right let
me know so I can send a v4.

Thanks,
Eugen

> 
>>>> +
>>>>  	return 0;
>>>>  }
>>>>  
>>>>
>>>> ---
>>>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>>>> change-id: 20260521-bcmpipm-6c578e73239c
> 

