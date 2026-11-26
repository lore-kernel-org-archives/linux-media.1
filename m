Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705208;
	b=dafajG6lXHZSUgNJn5at7lfM5PkI7Y9vdNEfwO2zivJxg6APwJuZCAB1Sp//q2OJ754n
	 FqWOJggsDiEYWiQBz7FhQ6AbUwhcd+snlWJ+8j69k6IczkqdMbaFO+RAooQ9M42A7SG/c
	 eXcsrHEcWvWWsyrvMP8JOWNMu11bi2VipNW9UWQGavGNdLUEI6gBvxyGqrpgYpBtYkH3e
	 P9w/bi27xYiVjgZEVwhMNwoIbBRy777N7k+X/nIKyC2f7VbAyLFKkqjn5s5Tq3QlnxwRB
	 bXl+zbUnOMWIWJVq3UoDx0Rj9+9GhyZJDYH19MV6LpOTwgH+8RbaYL3LQ9wmEilNE8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705208;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=G4b3dFHg0tvdbnb4TXJttoG2afJS8WFlVLY+6CDMkE0=;
	b=HepWSD7en65lUmGSJ4HmmLavNWyLWqN9wIrWYgEYL0yMuKks6soww6w1rk9MMQGOkYVk
	 a6yADrBvJNY49QHW07UzyE3pm5ME+Uj2N+vS3iFFcSzWFp8I3qOTnVLxSnu3My89axCQy
	 SfRNZeTTd0xU0F2ZCoqlOopaHt6H4d6e4UYNQPr2DNY4yE8WW15tR+Rqug7YXGFIiAJti
	 7Qkj239FcKXyA8U/SadTNUWzjcoSLGvhLwqpSXHBCH9qrT7jOiblXBaMmg29oQO8i1lQ4
	 jiNzwIhElIvrvPt9eNPop0l084jrAZ/X6qRtYW5ArMokK9kIWMjkbFKlrNyWcp8jMoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OyAaZiii;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB35606A333;
	Thu, 26 Nov 2026 15:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EB35606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OyAaZiii
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE5401BA8;
	Thu, 26 Nov 2026 07:00:04 -0800 (PST)
Received: from [10.33.48.93] (GM14V85S.arm.com [10.33.48.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D29A3F86F;
	Thu, 26 Nov 2026 07:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705207; bh=1fcrH9jumeQ+fD04PGZH05Eq8TBEmii97al5gS/oIO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OyAaZiiipunAESQC3EfdqhVnoJcyqbpgBTVTR82YqLGsohLs0r6+TtEzsvhtOg/1V
	 klVLI/kLfeHWDRT8p6tdVY4tnpQp6khQR/B/lQZgzebSw44DDYegyseYf6k9/dZscx
	 sVnxnGqmix/ZMd27GaXlRDnlVtW5LQYVFoNrMxB4=
Message-ID: <91794c90-a797-417d-88c9-8839529660e9@arm.com>
Date: Thu, 26 Nov 2026 15:00:02 +0000
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
Subject: Re: [PATCH 05/24] media: mali-c720: Add hardware identification
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nayden Kanchev <nayden.kanchev@arm.com>,
 Konstantin Babin <konstantin.babin@arm.com>,
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-5-0cb9bde1bd30@arm.com>
 <179559677600.14607.6594089332845207687.b4-reply@b4>
Content-Language: en-GB
From: Anthony McGivern <anthony.mcgivern@arm.com>
In-Reply-To: <179559677600.14607.6594089332845207687.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 25/11/2026 08:52, Krzysztof Kozlowski wrote:
> On 2026-11-24 17:07 +0000, Anthony McGivern wrote:
>>  struct mali_c720_top_regs;
>>  struct mali_c720_ctx_mgr_regs;
>>  struct mali_c720_modules_regs;
>> @@ -56,7 +58,8 @@ struct mali_c720_registers {
>>  };
>>  
>>  const struct mali_c720_id_regs *mali_c720_get_id_regs(void);
>> -int mali_c720_get_registers(struct mali_c720_registers *regs);
>> +int mali_c720_get_registers(enum mali_c720_version_id version,
>> +			    struct mali_c720_registers *regs);
> 
> You just added this code. Add complete pieces of code, not half-baked
> which you immediately need to fix/change.
> 

That's valid, initially I separated these changes from register access,
though they are somewhat dependent on one another. For V2 I will squash
this and the register access patch together.

> Best regards,
> Krzysztof
> 

Thanks,
Anthony

