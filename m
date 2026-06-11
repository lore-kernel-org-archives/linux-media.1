Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AC73859F7;
	Thu, 11 Jun 2026 17:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781198304; cv=none; b=mKB073CGVvhowLtHvyqNWdpwZ9A14tIoQsZiINterdk9jTsWbC46sOFB0qtIyF2OY8QcFyuafJhFTOue1BnS4ffuzEsJzVpobtTgGl2XvyRns/1xv1vPwTxuHpIOQt1cUw8qWSnvqBxOYXAcIT+zslSnwQKylMxIxgSflPM6veI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781198304; c=relaxed/simple;
	bh=pO5tqm/lJdWqQSvh85x/u0iDEFR3dUGObKGKt7EVsoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6gEzNK5zB7gOApQUe6Fhc++S+rBEE6YvlhDOUj2goyh9QiYzGDiLGwLiuGYnRzVNHdZPXFj+SGUnaNivUGrlt8fdecH3nBJ2IEfNWvLaT0w1Ba/2h71/MImD6rs/VkFm3Rp1HE+FEfLsyMrnJvKvMx9QDDHnrUFqUtAiyD5sJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdfJ7bGY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdfJ7bGY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6C11F00898;
	Thu, 11 Jun 2026 17:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781198297;
	bh=krrZepLc8L7ZdyxdLXZXSmqgc/kvpvrj4NOD+d/PTXc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OdfJ7bGYPX64RxmmsVIl1+tkwn78iJVoKmBzkS5qlTv3UiEOzS1GG4O3YkTXkvZk1
	 Z+euSJS6Dyh9CBXpnD9Yzm0pfydLLx2S5T4jbXFoZc4yTIoU9ZZ5MekhWCK6S4bP41
	 qrCbAvT/h+WyLlfSxnTiE88IRqqcyz3S0tXyYQSJdJCO9KVpW4d5ilokDLv17h2QDH
	 ZEYOXylH8dGleQGm0p8uHKd1YPIJLi8hrx+8MDx/vdMhHtHE2DmoRxMnxR0sDo01J0
	 wXKTUAGBR64vbzYtIHTYeFcaZrprC7G4/Ycig1q8Frw/W4aftAQnVL79HddCVZIh+/
	 X1NhF3sJDVYMA==
Message-ID: <3b142d52-53d1-4942-bb45-1cb9645c164b@kernel.org>
Date: Thu, 11 Jun 2026 20:18:10 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: bcm2835-unicam: Fix log status runtime access
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260611-bcmpipm-v3-1-c609dacb029f@kernel.org>
 <20260611080348.GC1758601@killaraus.ideasonboard.com>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <20260611080348.GC1758601@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/26 11:03, Laurent Pinchart wrote:
> On Thu, Jun 11, 2026 at 08:29:55AM +0300, Eugen Hristev wrote:
>> When requesting log status, the block might be powered off, but registers
>> are being read.
>> Avoid reading the registers if the device is not resumed, thus also avoid
>> powering up the device just for log status.
>>
>> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
>> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
>> ---
>> Changes in v3:
>> - Changed to check return value of pm_runtime_get_if_active() and only call
>>   pm_runtime_put() if the device is active.
>> - Link to v2: https://patch.msgid.link/20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org
>>
>> Changes in v2:
>> - changed to use pm_runtime_get_if_active()
>> - add corresponding put()
>> - Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d88045@kernel.org
>>
>> To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
>> To: Mauro Carvalho Chehab <mchehab@kernel.org>
>> To: Florian Fainelli <florian.fainelli@broadcom.com>
>> To: Ray Jui <rjui@broadcom.com>
>> To: Scott Branden <sbranden@broadcom.com>
>> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
>> To: Sakari Ailus <sakari.ailus@linux.intel.com>
>> To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> To: Hans Verkuil <hverkuil@kernel.org>
>> To: Naushir Patuck <naush@raspberrypi.com>
>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> Cc: linux-media@vger.kernel.org
>> Cc: linux-rpi-kernel@lists.infradead.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>  drivers/media/platform/broadcom/bcm2835-unicam.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
>> index 8d28ba0b59a3..96b51e29bba4 100644
>> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
>> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
>> @@ -2043,6 +2043,7 @@ static int unicam_log_status(struct file *file, void *fh)
>>  	struct unicam_node *node = video_drvdata(file);
>>  	struct unicam_device *unicam = node->dev;
>>  	u32 reg;
>> +	int pm_active;
>>  
>>  	/* status for sub devices */
>>  	v4l2_device_call_all(&unicam->v4l2_dev, 0, core, log_status);
>> @@ -2052,6 +2053,14 @@ static int unicam_log_status(struct file *file, void *fh)
>>  		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
>>  	dev_info(unicam->dev, "V4L2 format:         %08x\n",
>>  		 node->fmt.fmt.pix.pixelformat);
>> +
>> +	pm_active = pm_runtime_get_if_active(unicam->dev);
>> +	if (!pm_active) {
>> +		dev_info(unicam->dev,
>> +			 "Live data N/A due to device inactive\n");
>> +		return 0;
>> +	}
>> +
>>  	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
>>  	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
>>  		 unicam_get_field(reg, UNICAM_PUM_MASK),
>> @@ -2065,6 +2074,9 @@ static int unicam_log_status(struct file *file, void *fh)
>>  	dev_info(unicam->dev, "Write pointer:       %08x\n",
>>  		 unicam_reg_read(unicam, UNICAM_IBWP));
>>  
>> +	if (pm_active == 1)
>> +		pm_runtime_put(unicam->dev);
> 
> As far as I understand, the discussion on v2 concluded there was no need
> to test pm_active here. Did I miss anything ?

Sorry, I saw the message from Sakari and he was pretty confident on the
right way, he even mentioned that all sensors should be fixed, and has
not come up with a follow up since.
If v2 is the right way, please disregard this v3

Eugen

> 
>> +
>>  	return 0;
>>  }
>>  
>>
>> ---
>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>> change-id: 20260521-bcmpipm-6c578e73239c
> 

