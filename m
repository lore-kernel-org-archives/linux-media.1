Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716957;
	b=1kwlHeIWi7/fP9wrT9pRfMXLaMrs4hUsawU8ftoL085YH7WcCB7HbYXBUqGxVGXoJoJE
	 koqwcJ1N9diHt93YJ+abrwyWluQ7rQFB36z5hOXnlud/O0ViMmEYvLswn2WdI+JQjDllf
	 q2JAj43I2qW/9a5Lmy5OFe1LmlnUdM6LxcTl94xyapIcgdEbSI29F/ayGJ2Hl5Zz+tLwC
	 HD6egqzAQUMup3vC/dUIwY9RiaHF/Pv3DskpXeLD/XbG5C9jDb3/Mu3adLlFMDBr/MKuU
	 Md3Hetf+KexHuqwdypNukJayAoaVMN1q7s97rCHntyQBfZsWMjddsGSFOVkcMdi44AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716957;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=qyLdQkfNYwaIL2tvZVHosKJLHM/SF1iBQ073W2ag8io=;
	b=Y1febqZDGazKmA0EP9A/+AkFngXxJkvOlWbVyoiNMbW2CXNQeSu4xbRa7Zq9Jp+BzwRf
	 g6pLQNMuKmh5JW1sMb6wssH0YZhpcAarI34bcILdLVB1DfBEhhToHL85x59yQjwdOX+Y8
	 zUn57MpRlrlN2JNFsk/tfWziZV2AeVMG0GUzWEWDrjFCi3TOPCT35kkY1Qd3uUT3hFXtQ
	 Hw1hlTpVLKTJ3rKnnjsl+s8+yNHvQkgjMyyf5I7xJq/HtHOAG75710dHxeYZavegrw6Lp
	 mWLTH9iqh8VpTwinEMdLh+Glp1EYakrZgUv8xkdlY8MD2B03bHaHmXkN5Pq7WAkCeNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qOnMK50P;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D644D606A324
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 14:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D644D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qOnMK50P
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03CE9802;
	Tue,  3 Nov 2026 15:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793716817;
	bh=fM8o4Yo6P86qJeboPptU0LDF1gRn7q7sqG/GOoNdjNs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qOnMK50PBKh6oHOxSSuyvk+004pafcNzaowW/M8IjGltitFSkhnZHRE3Q//JC36s7
	 vOU7Jtx6M2ylrocsMAQ051XYvnXzQ1F05n3sz0tkz/C6okmxjKCoOHfGLDuLgBWilR
	 1cyffsIeejfgae0B2Ip1Xq69vU2f20M8FF6bSqvE=
Message-ID: <d78d7ee3-0c48-484a-a5b0-9ba44ebf9171@ideasonboard.com>
Date: Tue, 3 Nov 2026 14:42:30 +0000
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
Subject: Re: [PATCH 02/16] media: v4l2-device: Add struct v4l2_device.flags
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
 Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
 <20261103-rkisp1-suspend-and-resume-v1-2-08f863b6fdc5@ideasonboard.com>
 <25952c4c-36db-4361-9ab6-0ca1b1f960bf@oss.qualcomm.com>
 <3478043661b8d89ba5089f56383926785570b7b3.camel@ndufresne.ca>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <3478043661b8d89ba5089f56383926785570b7b3.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi both

On 03/11/2026 13:51, Nicolas Dufresne wrote:
> Le mardi 03 novembre 2026 à 10:09 +0200, Gjorgji Rosikopulos (Consultant) a
> écrit :
>> Hi Daniel,
>>
>> On 11/3/2026 9:40 AM, Daniel Scally wrote:
>>> Add a flags field to struct v4l2_device, along with a single flag
>>> value that is designed to tell v4l2-async in which direction data
>>> flows for this v4l2 device so that it knows how to set up device
>>> links between subdevices connected using the async APIs.
>>>
>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>> ---
>>>   include/media/v4l2-device.h | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
>>> index 25f69b1b8db03d077f7570471d5c6910fcafe110..9b17916d63641ba637cf8c37aa925749bd4e2134 100644
>>> --- a/include/media/v4l2-device.h
>>> +++ b/include/media/v4l2-device.h
>>> @@ -15,6 +15,9 @@
>>>   
>>>   struct v4l2_ctrl_handler;
>>>   
>>> +/* Set this flag if this V4L2 device is an "output" rather than an "input". */
>>> +#define V4L2_DEVICE_FL_IS_OUTPUT			BIT(0)
>>
>> Just for the clarification do we change the meaning of output->capture to input->output?
>> I know that output is confusing for everyone including me but somehow i get used to it.
>> However to clarify what this means will be helpful :-)
> 
> I agree this is confusing. To avoid all the legacy, we could use PRODUCER /
> CONSUMER, or does anyone has a better idea?

I have no better ideas - naming things was never my strong suit - so happy to use PRODUCER / CONSUMER.

Thanks
Dan

> 
> Nicolas
> 
>>
>> ~Gjorgji
>>
>>> +
>>>   /**
>>>    * struct v4l2_device - main struct to for V4L2 device drivers
>>>    *
>>> @@ -30,6 +33,9 @@ struct v4l2_ctrl_handler;
>>>    * @ref: Keep track of the references to this struct.
>>>    * @release: Release function that is called when the ref count
>>>    *	goes to 0.
>>> + * @flags: device flags. Can be:
>>> + *   %V4L2_DEVICE_FL_IS_OUTPUT - Set this flag if this V4L2 device is an
>>> + *   "output" rather than an "input"
>>>    *
>>>    * Each instance of a V4L2 device should create the v4l2_device struct,
>>>    * either stand-alone or embedded in a larger struct.
>>> @@ -54,6 +60,7 @@ struct v4l2_device {
>>>   	struct v4l2_prio_state prio;
>>>   	struct kref ref;
>>>   	void (*release)(struct v4l2_device *v4l2_dev);
>>> +	u32 flags;
>>>   };
>>>   
>>>   /**
>>>
>>
>>
>> _______________________________________________
>> Linux-rockchip mailing list
>> Linux-rockchip@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-rockchip

