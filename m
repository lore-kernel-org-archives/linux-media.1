Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609628;
	b=CCqtEQoPZvt3eS1t/YmXdTBa+YqJzdfNz4lLOWPXDXF3QYvE+gsBahg5u0HUa041sXPT
	 LojfM/9FzPjO4ugFFrdEMV04V5d86XZeghV/Hgm8ufPuekZns/qJo47HBv5gtbc/rqRnB
	 rC0dczgRaiwNP4X55rQM2eErDFQY37Lv6v6zPxj4LkyUE8IGz98JpKO6BXuOFz7skg/Kz
	 v2/vC8y/KCH3J3qJkoZxGcEVltBNmezMNdirbBQxq5kRwwTELTfiSuFC8TwoMFPw7MlEe
	 bhVVt9XSxcnwgoh5s7hzPlvIIEsVDFC3x8UXK+DnrnGUJHfok/jtZvLxfiNWalqS8qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609628;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=w2nwquiQVweXPWFNSd+XgWLcPSwgfU8EaVQ/WV303JQ=;
	b=4yGcMZ3VMNseEntmgW9qu4sMWXXCRneTCeDZeF2bB5T8vC6ie9rdcM5MdHkWHNBiPBJZ
	 X+M4H4wGtSCeIqzONic5ohJ1B153IZ2n2PpbYjTsEMZYiJTWi4odT4zed7649YpGOczXn
	 bIlMpBX+eJy7xBTYPqRj8/OhYO6nKNV5UpSNGkzAII4CwKnLf7nCZ+9Ki8L+y5tus8aha
	 Y1ZmRGmTAHZ/gAOq6dhHjiS02pB5LfomOJoH1PqNSc9JD6sP9agaOGLK3Yw/qgcVS6p+O
	 yIoth8wCoD+eS3X28bxwCJ+JtYYLg+canUhG5sXzIcMATDq/CHE3CNwH/ARjf7SRytA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NWeyJuIz;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F85606A31E;
	Wed, 25 Nov 2026 12:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F85606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NWeyJuIz
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5437E339;
	Wed, 25 Nov 2026 04:27:04 -0800 (PST)
Received: from [10.2.201.43] (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAD233FA32;
	Wed, 25 Nov 2026 04:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795609627; bh=1Q7kE2HhjHTi6Ac9bx5RhPVTsYmn3cK/MoKao9dxtA0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NWeyJuIzOFIMRqOapePBowohl1O3XyZDLzOS3xXB/bAjtn1lf+95mCoXblxTcDdDY
	 nYOG9UU3bjoCA1uDhzFrD+Wp2WZG/nWFe0AEftowrwNIK5i4kzE/NArkxAoHbZaxEf
	 Rgo5MwzTc0bPlNIqFR64S5g1RiFkeweafGyp3w00=
Message-ID: <8908e60f-11df-4c5d-9e3f-48dba74910b4@arm.com>
Date: Wed, 25 Nov 2026 12:27:04 +0000
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
Subject: Re: [RFC PATCH 04/28] media: mali-vpu: initialize decoder format
 state
To: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
 Shobhit Pandey <shobhit.pandey@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-5-charvi.mehta@arm.com>
 <d1d53edeb358e1bdcd1c262e48074f7f1be276cf.camel@ndufresne.ca>
 <b152209e-6117-4a24-aa2d-59be913850b5@arm.com>
 <5d46d320bf3b956bdd3413f8a88beedf07938fc4.camel@ndufresne.ca>
Content-Language: en-US
From: Charvi Mehta <charvi.mehta@arm.com>
In-Reply-To: <5d46d320bf3b956bdd3413f8a88beedf07938fc4.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/24/26 17:35, Nicolas Dufresne wrote:
>>>>     struct mali_vpu_session {
>>>>     	struct mali_vpu_dev		*vpu_dev;
>>>>     	enum mali_vpu_session_role	role;
>>>> +	struct mali_vpu_port		port_src;
>>>> +	struct mali_vpu_port		port_dst;
>>> Ok, its time to comment, src_port and dst_port is a lot easier to read imho.
>> I’ve generally placed the direction last, as in dec_src/dec_dst and
>> pixmp_src/pixmp_dst.
>> I’d prefer to retain port_src/port_dst to follow that pattern.
> I heard your preference, but readability when up-streaming is important, we dont
> say "the port source", we say "the source port" (at least in english, which we
> program in), and so when a human reads your code, having things in reverse makes
> it harder.

I'll rename these members in v2.

Regards,
Charvi

