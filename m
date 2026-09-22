Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C09B55D884
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 15:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091427; cv=none; b=TuIdESEoJ9qglciqT50m5qEo43Mi2RAWcXRJJeieMZjR9I9f/ZqM3G5N1BCIrqZQad2PIPk7bqf9wM6Zi0D3+epDs8198pLuVxfjmbT7uEaj+OmysEzCrgLuWyobdRjP5/IAljKTwvCGV6Bzgt0FUhhHNXr9HHKGxj/M4E5y278=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091427; c=relaxed/simple;
	bh=AeF3KiuWhPo+6FdzvQu5mLS392Y/X6WP04MbKSE79MI=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=dYo/HTK2zTrsxx15+WQOBJHJYnmb7rKUUvvRFTQRvE08nc1eHilKtkJgWXdOlwQPIGrSkSfF6nR6spVdqRMxwHh1Uagr8u3bdoeC2UKAtkcsmwnYWD+ZHDnGxLZYZEz7+QeRauxmuyyGnSitvwKbMNqBIlscCPw1vWobqutyExg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RAYYylDG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RAYYylDG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42121F000FF;
	Tue, 22 Sep 2026 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790091425;
	bh=v2rfaTyJBVqqWuNBnfiMYgPfIL0m0Mg9EhtXORV2UyU=;
	h=Date:From:To:Cc:Subject;
	b=RAYYylDGJWFR6iAJIGmRIcDzNnYF82rKo8YKWJtF+XnIU/SzLk55hAycOzrpAL+10
	 KW+NNQBJ0MdJ7K6JpYpczL89zpSx8YWvziGp+eacbXPU4Hf9gBcmnxs/WQi9kcwwqS
	 MzqKsafeaPQMyfwyQotBmxuVF09Cxf4tAq0jk+7R+7RDYkXjkyAW9Ra8GrhCT9BXcs
	 +wWAIPEnuWFy/bFJrjNonxVY5g16q4Qx+QgfqSrGOYSNqiPHmp2ARNJDiRxYy1reJN
	 w8E8KbtZoC0YlBTi3oYEeT2Rqe3DMiClSceKe7aDB4+xeBoD5o1L3sIFDTSf8Bdrbs
	 nMlixbhwTwpmg==
Message-ID: <8d8203ba-a406-4730-9493-dbab8b3ec831@kernel.org>
Date: Tue, 22 Sep 2026 17:37:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans de Goede <hansg@kernel.org>
Subject: RFC: Remove gspca and old ISA radio drivers
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

Would there be any objection to removing the gspca driver for all those old
webcams with horrible quality and that nobody should be using anyway, and
for the old ISA radio drivers where I am pretty sure I'm the only one that
can actually test them (and even that is questionable).

I could move them to staging/deprecated for a kernel cycle, but to be honest
I think we should just kick them out.

It also allows me to throw away a lot of old hardware and make some room for
new hardware :-)

Regards,

	Hans
