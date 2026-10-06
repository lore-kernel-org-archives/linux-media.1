Received: from ns.mm-sol.com (ns.mm-sol.com [37.157.136.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4990238238D
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 06:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.157.136.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268697; cv=none; b=cqNFp1u9aTkjQ7QXbEgq3pap2o7DhojcKaHAcVig9Xn6E4GmXshctUL+G10K8WNWX7kQFCxT2ZoBdeVnXFWeoA71WHCZWWlXMBcVfA7tM8zoihkxDX+5P7zjcPHRjLY8rozVThxKlyruZddDoj4WRrZ2jSRNVt0T+MbTwAtYHn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268697; c=relaxed/simple;
	bh=mMLnBCWMVuCyHh579WixY2/a22DJeY3beqnzfpd9jUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HvWJHjiXxvDsjPjYG8qxxQK8MleflgqyAwQbAC6TmqZMC3SGPoaxwYBkB4RkZqyDciv65ZLxTT43hX+MZDh51KVfxqu+AknuWdRRbHItsq+EWyaZzu1ph00uvWUuMhCd1YMeltaBwQw4kVPl7ip3BO0An+2dpyovpP3moaQ/86o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mm-sol.com; spf=pass smtp.mailfrom=mm-sol.com; dkim=pass (2048-bit key) header.d=mm-sol.com header.i=@mm-sol.com header.b=JcvTENqF; dkim=pass (2048-bit key) header.d=mm-sol.com header.i=@mm-sol.com header.b=JcvTENqF; dkim=pass (2048-bit key) header.d=mm-sol.com header.i=@mm-sol.com header.b=SRRp8Mb/; arc=none smtp.client-ip=37.157.136.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mm-sol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mm-sol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mm-sol.com header.i=@mm-sol.com header.b="JcvTENqF";
	dkim=pass (2048-bit key) header.d=mm-sol.com header.i=@mm-sol.com header.b="JcvTENqF";
	dkim=pass (2048-bit key) header.d=mm-sol.com header.i=@mm-sol.com header.b="SRRp8Mb/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mm-sol.com; s=201706;
	t=1791268244; bh=mMLnBCWMVuCyHh579WixY2/a22DJeY3beqnzfpd9jUI=;
	h=Date:Subject:To:Cc:From:From;
	b=JcvTENqFL/MRtT5WBmxVfKF4oDQ8TZplWvWngvNtb9gVgeK+279gg/qlip9VbaqJU
	 RW9XsTr0ALEuF2bzXT2VgYxacScEuB/xuH/sv2dOrv7hrlDc7QHY8KLLsnxv2LLhav
	 77Y1rL6EylFa6tBYzW0T90kgxBCmLGVgPuKHJ0jvVPv0xXgffNqnigjTPTcgjqB31L
	 xxMb97KUbiJB5UaF1gefgQS+8lHCCjZlQe9p5ygm4zbNkU99GoJJIBy06eRmc6zEaH
	 zGUkv7HzPpCXlCV4Otjd5GPuzjhlkDEI+EOWhc2JJif/6UF0aABAnjoVkBhuLtlNPm
	 WqghEnqXznbTg==
Received: from intsrv.int.mm-sol.com (unknown [172.18.0.3])
	by ns.mm-sol.com (Postfix) with ESMTP id D7E6A802D6;
	Tue, 06 Oct 2026 09:30:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mm-sol.com; s=201706;
	t=1791268244; bh=mMLnBCWMVuCyHh579WixY2/a22DJeY3beqnzfpd9jUI=;
	h=Date:Subject:To:Cc:From:From;
	b=JcvTENqFL/MRtT5WBmxVfKF4oDQ8TZplWvWngvNtb9gVgeK+279gg/qlip9VbaqJU
	 RW9XsTr0ALEuF2bzXT2VgYxacScEuB/xuH/sv2dOrv7hrlDc7QHY8KLLsnxv2LLhav
	 77Y1rL6EylFa6tBYzW0T90kgxBCmLGVgPuKHJ0jvVPv0xXgffNqnigjTPTcgjqB31L
	 xxMb97KUbiJB5UaF1gefgQS+8lHCCjZlQe9p5ygm4zbNkU99GoJJIBy06eRmc6zEaH
	 zGUkv7HzPpCXlCV4Otjd5GPuzjhlkDEI+EOWhc2JJif/6UF0aABAnjoVkBhuLtlNPm
	 WqghEnqXznbTg==
Received: from localhost (localhost [127.0.0.1])
	by intsrv.int.mm-sol.com (Postfix) with ESMTP id D2B2EFC248B;
	Tue,  6 Oct 2026 09:30:44 +0300 (EEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106)
Received: from intsrv.int.mm-sol.com ([127.0.0.1])
 by localhost (mail.mm-sol.com [127.0.0.1]) (amavis, port 10026) with ESMTP
 id 7PP8h1A2iSPi; Tue,  6 Oct 2026 09:30:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mm-sol.com; s=201706;
	t=1791268242; bh=mMLnBCWMVuCyHh579WixY2/a22DJeY3beqnzfpd9jUI=;
	h=Date:Subject:To:Cc:From:From;
	b=SRRp8Mb/W8YGNFVbsOHVLUUDQK56i47+YX+ADUCX8Qvtcs83WHPuGqlIlm0X2ar+Z
	 PgnrdkYJiAzqNL7zScooobV1yZQOyPb81PeokkzIWEudCIsD/BB1xQxeXiCxv6oq7I
	 0m14JqIZ+OV1UXhDXhEemP5uHf4mPX+2aZmIsbHRXZz0hD/kuEYjpttAi3RBhJ7oN8
	 mWh/a02FzliODgHq/XAJXdXE5oxpUSSTr9T9tBj1pSq1W2T2eoTNebvU5RcRvWGk3o
	 Fsx7wdOZTP60JZFWWVjZioMFdb560sHjhMk0ec79S/EH8sg56N276k8MO7TvVG84X8
	 dojE4aVpeBDTA==
Received: from [172.20.2.172] (unknown [172.20.2.172])
	(Authenticated sender: grosikopulos@mm-sol.com)
	by intsrv.int.mm-sol.com (Postfix) with ESMTPSA id 6463AFC248A;
	Tue,  6 Oct 2026 09:30:42 +0300 (EEST)
Message-ID: <e4b965c0-83fd-41e4-8ed0-81d53c2d57dc@mm-sol.com>
Date: Tue, 6 Oct 2026 09:30:24 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
References: <20260914233810.GA2796257@killaraus.ideasonboard.com>
 <2e1d628f-8183-4446-9500-9886561f320b@mm-sol.com>
 <20260930232332.GG944070@killaraus.ideasonboard.com>
Content-Language: en-US
From: Gjorgji Rosikopulos <grosikopulos@mm-sol.com>
In-Reply-To: <20260930232332.GG944070@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 10/1/26 02:23, Laurent Pinchart wrote:
> Hello Gjorgji,
> 
> On Fri, Sep 18, 2026 at 02:10:07PM +0300, Gjorgji Rosikopulos wrote:
>> Hi Laurent, All,
>>
>> On 9/15/26 02:38, Laurent Pinchart wrote:
>>
>>     We can consider scheduling a third topic. Proposals are welcome.
>>
>>
>> Below are my proposed discussion topics. All of them relate to advanced camera
>> use cases:
>>
>> 1. Electronic Image Stabilization (EIS).
>> 2. Multi-frame Bayer or YUV noise reduction filters.
>> 3. QUAD CFA reconstruction, including preprocessing algorithms for
>> high-resolution Quad Bayer sensors.
>> 4. AI-based denoising in Bayer or YUV domains, focusing on image preprocessing
>> denoising algorithms.
>> 5. DOL and video HDR use cases.
>> 6. Background blur for video conferencing applications.
>> 7. Face detection algorithms operating directly on image data.
>> 8. Multicamera 360 image stitching etc.
> 
> Those are all interesting topics, but I won't be able to schedule all of
> them in 15 minutes :-)

I agree those topics will require more time to discuss.

> 
>> All of these use cases and algorithm implementations can be vendor-specific or
>> third-party solutions and may run on a GPU, DSP, or other accelerators.
>>
>> I also think that, similar to the IPA used for 3A algorithms, we need an
>> IPA-like for frame-processing algorithms.
>>
>> As discussed, the only practical way to upstream such functionality into
>> libcamera is to provide an open-source alternative (even a simplified
>> implementation) that defines and covers the use case, including its input/
>> output parameters and interfaces.
>>
>> The main question is whether these algorithms should live inside libcamera or
>> outside of it. Both approaches have their strengths, but I am personally in
>> favor of integrating them into libcamera, perhaps as a layer above the pipeline
>> handlers, for example through use case plugins or a similar mechanism.
> 
> I've long thought that libcamera should make pipeline handlers more
> modular. Pipeline handlers would implement components for the pipeline
> elements (such as the inline frontend and offline ISP) and declare how
> those components are connected. We should be able to move most of the
> logic required to run the pipeline into common code.

That will be really good to have.

> 
> With a modular approach, inserting elements in the pipeline could become
> easier. It's however not clear to me yet if we should try to separate
> the processing required for the use cases you list above from the "core"
> of pipeline handlers, into a separate layer on top, or if some use cases
> would benefit more from being able to inject elements into the pipeline.

I think that we will need some scheduler or code for driving different usecases,
also it should be noted that processing order may depend on the parameters,
An example we have preprocessing noise filter which can be enabled disabled,
or HDR. Depending on that the processing blocks participating in the pipleine
may change. But one step at a time.

> 
> Note that we have started experimenting with the concept of layers, see
> https://patchwork.libcamera.org/project/libcamera/list/?series=5753/

Thanks i will check that work.

> 
>> We can also learn from Android's approach. Initially, the HAL3 and per-control
>> APIs were created to allow applications to implement advanced algorithms such
>> as HDR and EIS. Later, CameraX Extensions were introduced so that these
>> capabilities could be shared across applications and benefit the broader
>> ecosystem:
>>
>> https://developer.android.com/media/camera/camerax/extensions-api
> 
> It's certainly something we should study more. As usual with Android
> there's little documentation on the underlying architecture though :-(
> 
>> I believe Linux faces a similar challenge. Once PipeWire and GStreamer plugins
>> based on libcamera become widely adopted across Linux distributions, it will
>> become increasingly difficult to introduce these advanced use cases at higher
>> layers of the software stack. Having a standardized framework within or closely
>> integrated with libcamera could make these capabilities more accessible and
>> reusable across applications.
> 
> No fundamental disagreement there, although we should also be careful
> not to reimplement GStreamer or PipeWire inside libcamera.

I agree on this, but having some concept like bins in gstreamer will also help for the entire usecase,
the question is whether we need to expose using multiple stages of reprocess the control to the app
(gstreamer element, PipeWire or other libcamera application) or have them build in libcamera. Both have benefits,
having ability the application to add intermediate stages gives freedom to experiment and some vendors to implement their
algos outside of the libcamera, On other hand side standard supported application like teams/slack browser will not 
have those extras example with cameraX extensions in Android which have been mentioned earlier.

> 
> An important question that will need to be answered is who will be
> willing to do all this work.

We have two eng in MMS which can start experimenting with those extensions in libcamera, i will actively involved and drive this activity if
there are no objections :-). Once you are back from Prague i can schedule a meeting for further discussions.

>

Regards,
~Gjorgji

