Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308658;
	b=TkTJLf0T7azYdXwb9pVuhLstMSqtcspZsFOSb6dagER7wqbhp6g5ZQBXKiYKMFD3mO2N
	 xcqgT2EnkyEYbEQcZpG2h/sqWVgF+nlh+LEPK/CyAc+eGHNXZizDbRkqvsgg9ZOc7BdHe
	 d/jwKo5aMQ6gj1+h1oTR1LC2Niaz/s0/QlP5t+PNDmNwmlxQsDypBKWvU7qsZohSsmaX1
	 UZk4p8VR6L7WcyW2/yYQnDX2KzhT0uR95jAQwqndWkMOOfBZxGHX3msa4eF7mlAcCmasG
	 /o30329Rs9Tlih2N10iRa1AOXp5tG2NbBCYGwNVaw91tLak7e7dl4Geq3H8bwYmQCzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308658;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WAywVlrX++mUZVVsIyzfP/BpfT3zDp/kOabAQ4D1QIs=;
	b=mvFcYc4n0o4H3iCwZeSsC2Lj8H3/9lr7qckmA2xqLAJlfYvDKiJrEoOoVV2CZU0rOQfI
	 Ek6pFVWvo9JwCirY/UP7BGCFkoxDol1f6TcSKJhXEhrJxRup8Bv7qyd/QXlLgj6/s1IMF
	 JFnxlwOApiRm75dBBooa0Bit6Y8me/IhVBiItkZ1VHqKoNmlftAW90mlBiVGYW3XYMCvj
	 wrlT3BhVl+602XhNveTavfBWhV4Pup86jckaojNW4btJPr7NnpMjji6AR/ZqrDH/H7U+e
	 jm949rHfik2ffVUaYj0WoLBTWXdw7Muf2cQqrFE5/yzbb03QDgch1Ecw4T8b+uSoMqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B0oLPXzp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25667606A321
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B0oLPXzp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2BB1F008A2;
	Tue, 10 Nov 2026 11:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794308657;
	bh=WAywVlrX++mUZVVsIyzfP/BpfT3zDp/kOabAQ4D1QIs=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=B0oLPXzpNlIOqULJ9va3TtF22Uih2cg5oWjarp26qW2CbwyHmgd52JWvERhw2oLeO
	 OoH+DvSdEw+74SBbxrifAA/m7S0T043eKSV7iC4Y7GUIumNTl2se4anDx07j9X7ki7
	 phHCQX7Cu7A3QL3aHwtsxK3O6c4IXUMLeNhLVTQXINZgdbSiYtbAJNKAS8dc9SksTB
	 lh39IdsUFBlpalYnU6E3FW6V3DfkfTGdZc7WfGH0UzlQIv6DnCgQMWkNQOdQN0JGg0
	 SFCP8Jfxk43uuR2C5SQh3B5Tkg1k6Sov4jwC9pBsnOmRv3XBrPcWiOrOh4mqyuSGtd
	 yGLRemDMDiHSg==
Message-ID: <4fdd23e2-bd84-4182-946c-8295766de8f7@kernel.org>
Date: Tue, 10 Nov 2026 12:04:14 +0100
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
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] Documentation: media: Document impact of errors on buffer
 fields
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20261030103815.3098340-1-laurent.pinchart@ideasonboard.com>
 <auR63iwOm_mih97K@valkosipuli.retiisi.eu>
 <20261030140958.GB3109745@killaraus.ideasonboard.com>
 <auUepevHsfBZB2nV@valkosipuli.retiisi.eu>
 <9fe913fc3f750462a4655d51fa1a2f110a02ea18.camel@ndufresne.ca>
 <20261109233315.GA1000823@killaraus.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20261109233315.GA1000823@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

It seems I missed this discussion, so apologies for being late to the party...

On 10/11/2026 00:33, Laurent Pinchart wrote:
> Hi Nicolas,
> 
> On Mon, Nov 02, 2026 at 09:40:22PM -0500, Nicolas Dufresne wrote:
>> Le samedi 31 octobre 2026 à 00:48 +0200, Sakari Ailus a écrit :
>>> On Fri, Oct 30, 2026 at 04:09:58PM +0200, Laurent Pinchart wrote:
>>>> On Fri, Oct 30, 2026 at 01:09:18PM +0200, Sakari Ailus wrote:
>>>>> On Fri, Oct 30, 2026 at 12:38:15PM +0200, Laurent Pinchart wrote:
>>>>>> When an error occurs related to a captured buffer, hardware can produce
>>>>>> less data than expected (or no data at all), and timestamps may be
>>>>>> unreliable or unavailable if the device uses hardware timestamping.
>>>>>> Document this in the description of the V4L2_BUF_FLAG_ERROR flag.
>>>>>>
>>>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>>> ---
>>>>>> I've posted a corresponding fix to v4l2-compliance in [1] to relax the
>>>>>> bytesused and timestamp checks.
>>>>>>
>>>>>> [1] https://lore.kernel.org/linux-media/20261030103717.3098080-1-laurent.pinchart@ideasonboard.com
>>>>>> ---
>>>>>>  Documentation/userspace-api/media/v4l/buffer.rst | 5 +++++
>>>>>>  1 file changed, 5 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
>>>>>> index 94dc2719e907..5a7a1511cee7 100644
>>>>>> --- a/Documentation/userspace-api/media/v4l/buffer.rst
>>>>>> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
>>>>>> @@ -503,6 +503,11 @@ Buffer Flags
>>>>>>  	streaming may continue as normal and the buffer may be reused
>>>>>>  	normally. Drivers set this flag when the ``VIDIOC_DQBUF`` ioctl is
>>>>>>  	called.
>>>>>> +
>>>>>> +	Depending on the type of error, the buffer may contain less or no
>>>>>> +	data. In such cases the ``bytesused`` field can be lower than expected,
>>>>>> +	including being zero. The ``timestamp`` field may also be zero or be
>>>>>> +	otherwise unreliable.
>>>>>
>>>>> Could we say that if bytesused field is non-zero, then there is a
>>>>> timestamp, but when bytesused is zero, there's no data and probably no
>>>>> expectation of a valid timestamp either?
>>>>
>>>> How about this?
>>>>
>>>> 	Depending on the type of error, the buffer may contain less data than
>>>> 	expected, or no data at all. The ``bytesused`` field reflects that
>>>> 	situation. When ``bytesused`` is zero, the ``timestamp`` field may be
>>>> 	unreliable and may be zero.
>>>
>>> Looks good to me.
>>
>> Since its not specified, have you asked yourself if this is CAPTURE device
>> behaviour, or if you do believe this should be true for all type of devices ?
>>
>> I've had recent discussion for M2M in regard to CAPTURE buffer ERROR. The API
>> has a gap and we don't know if we should complete a capture buffer when an
>> OUTPUT buffer triggered an error. If the timestamp copy should be honoured and
>> what the byeused size should be and mean.
> 
> Good question. The bytesused field is actually not well specified for
> OUTPUT devices. The documentation only states that it's set by
> applications, therefore at QBUF time, even if that's not explicitly
> stated. There would be no interaction with the ERROR flag then, as the
> flag is set by drivers at DQBUF time.

Strictly speaking there are no requirements for the bytesused field for
output devices. For capture we have no requirements for bytesused when
queuing a buffer, and for output it is the flip side: we have no requirements
when dequeuing the buffer.

Now, that said, ideally drivers should just preserve the bytesused field
when dequeuing output buffers. And bytesused definitely must not be >
length field, so it can't contain a random value. This is regardless of
whether the error flag is set or not.

I think v4l2-compliance can give a warning if bytesused was not preserved,
and a failure if it is > length.

Test it with the test-media script first, though. To ensure that our
test drivers all do the right thing :-)

> 
> At DQBUF time, I'm not sure what should happen for OUTPUT devices. I
> could image a theoretical use case where a driver would want to report
> how many bytes have been consumed in case an error occurred and only
> part of the buffer was consumed, but I don't know if there are any real
> use cases for that.
> 
> The same likely applies to the timestamp. I think the current
> documentation is quite vague there too. It states that
> 
>   For output streams the driver stores the time at which the last data
>   byte was actually sent out in the ``timestamp`` field. For output
>   streams that use ``V4L2_BUF_FLAG_TIMESTAMP_COPY`` the application has
>   to fill in the timestamp which will be copied by the driver to the
>   capture stream.
> 
> So for a pure OUTPUT device I can imagine that the returned timestamp
> could be unreliable when an error occurs, while for a M2M device with
> TIMESTAMP_COPY the timestamp on the output side will not be modified by
> the driver, and the timestamp on the capture side should probably be
> always copied.

I agree with that. However, I am not certain if m2m drivers always do this.
I'd say that we check for this in v4l2-compliance, and if we find drivers
that fail the test we fix them. Should it turn out that for some hardware
this is not possible to do for some reason, then we can always relax the
requirement.

> 
> Should I document that the behaviour described by this patch only
> applies to capture devices ?
> 

It would be nice to cover both capture and output devices, if possible.

Regards,

	Hans
