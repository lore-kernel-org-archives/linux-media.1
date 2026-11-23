Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449445;
	b=Gm7QiQiAauX1mLkITZYnjqz78Gv/SM5pOqiFGeWenYJblB+NVH98Mbq9D5NWGOsaJ+wr
	 Rx54tTl6OkZcFl9T/j6bDF21eC5fu/fhBdWdj/Nf2p08MNf0TX95dMUuSZOK0SEzWuayo
	 +XdT/jzTGembKkWZLp8NyNY0Ika+H360VfvmJftxfoNGguLjtTrBtkwiIzQ2Df3gg7oEk
	 BgHSOXsys81T2PbVYmLSKvAc4jZUMolCBRlk797xk9sm2cEUbABkz9gIQ5r6EHpRyO/N4
	 JLX4ZTH8RlOfb6ERAu4IFIAekvnq/1BcdewNqDF8CADavEHrPErEbVTRSJUx/sgCbLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449445;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=XnC/zvaqz+BP2xABSYK5DwvAXqfcSU67vbMlsSlT42A=;
	b=sbvIkYrghUJRw/0R19B5My0Ij5dJbOdZEKkeWs5WoBrIDa2uAc/ZqvttSuSDZ4REtdFt
	 dlJRj/V5N9cm2kkPicFAZlMoIHTrps2QYaCJ+IEPB2nS1lTDd8FfxynzjKmJuHNqSD3TT
	 4+qM1DoWilZ9pAxfnH/1jZp1/w0rHo5S9abauxSt5lemUQberZUyns4YwAfSib94t1Byq
	 z2zb9tmtCVWsnrAqcLWezqPwsEvSKZ0OnmbPHx6ryLxZwu4A+7fwPcj6qCCMip4Hwe4Dw
	 5GQXn+5x14eZGn8dRodj3Gmklr0bSY30UXhiRagEWg19A1bNFyQAykAUdpC9Wo/Vv5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="D3F/skQp";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38DD606A31A;
	Mon, 23 Nov 2026 15:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A38DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=D3F/skQp
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A12C143D;
	Mon, 23 Nov 2026 07:57:21 -0800 (PST)
Received: from [10.2.201.43] (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 008ED3F632;
	Mon, 23 Nov 2026 07:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795449444; bh=ZCGRnUE04Krh/+ZqT5Qg4nFGw6DpXnRPMANbf+wNcCk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D3F/skQp6kGWVf8vzSozuocGOAVW8NkAbIG3aJ4v3auXwZU0kd4aQ0DQkB8F2Fzo4
	 n2gZ/Kt5RAlvlxZKA/yy/muQxwahl91QpWeDv1e3efEygku4d5pWuSxfM7tQWyTsMa
	 z/OimbKVIe0YO/nrn5rfnbeOmDw95S5TzR+rFZ9o=
Message-ID: <9a643f44-3143-410a-ae0e-21bc27cb1be0@arm.com>
Date: Mon, 23 Nov 2026 15:57:20 +0000
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
Subject: Re: [RFC PATCH 00/28] media: add arm Mali-V76 video decoder driver
To: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
 Shobhit Pandey <shobhit.pandey@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <fe3f3912af33f1afed3459671fdf93a5a6764c27.camel@ndufresne.ca>
Content-Language: en-US
From: Charvi Mehta <charvi.mehta@arm.com>
In-Reply-To: <fe3f3912af33f1afed3459671fdf93a5a6764c27.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nicolas,

Thanks for reviewing the series.

On 11/19/26 19:44, Nicolas Dufresne wrote:
>> [5] Fluster was run with
>>
>> GStreamer-H.264-V4L2 decoder:
>>
>> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2
>> Ran 78/135 tests successfully.
>>
>> The failing tests:
>>
>> 52 test vectors fail as they are interlaced clips which mali-vpu does not
>> support.
> Is that a real hardware limitation, or you are just skipping it in firmware or
> even in this driver? Its not like you have a compliant decoder without it. I've
> recently asked Amlogic to not cut corner also, and they accepted to fix their
> new driver.

V76 supports interlaced decoding, but it was not exposed in the initial 
driver
submission because the capability is being phased out in later hardware
generations. In v2, I’ll enable it through a variant-specific capability 
flag,
allowing it to be disabled for future hardware generations that do not 
support it.


>> 1 additional test vector, CVFC1_Sony_C completes decoding but fails checksum
>> verification due to a stride-handling issue in GStreamer 1.24.13. GStreamer
>> replaces the driver-reported 150-byte planar chroma stride with 152 bytes,
>> causing the decoded chroma planes to be read incorrectly.
> 1.24 is very old by now, but I think this specific file needs more work. One
> part of the fix has been made recently:
>
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/13059
Thanks for the pointer. I retested CVFC1_Sony_C with GStreamer 1.28.9 and
the 1.29.2 development snapshot, both with that fix backported. The Fluster
GStreamer backend still reports a checksum mismatch in both cases.

Decoding CVFC1_Sony_C with our V4L2 test application produces all 50 frames
and matches Fluster’s expected checksum. This points to a remaining issue in
the GStreamer path in this setup. I'll update the v2 cover letter to 
describe
these results.


Regards,
Charvi

