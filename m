Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.247.196.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433217;
	b=larLfzBnGdzlYiyHSaGcw3qS4e2XIi0/k/dAW3uQeM2UXVLdZrIwLNQrfQaihg6vBxge
	 yQqv5VAMiUykO4+o/U7QSCBq2neUFq7hIft7/scBdyOT/vJvBtAsp0KtRcBRcUbr2iIXf
	 QEjA0uYhvchc8DrvEESqSO5q/JdOYY1q8Pj7jKfKeC+Rf8hwzc85hvEIcg9YwWsCS4iiS
	 kC1li7ZqPY9LqzAzcEtYaE1NLpGM5a7NGBJTHcCF5F5m5pnr6Uooa96PiFvnKtcjdy1ka
	 aAIt3DoXJ74xY8Y4dGlgvR2o+WtdBT4JpDkl1i+yFR507IjehaYZH6uteEy5WwYXHgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433217;
	h=DMARC-Filter:X-Originating-IP:Received:DKIM-Signature:X-Session-ID:
	 X-Originating-IP:X-Works-Send-Opt:X-Works-Smtp-Source:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6sk62LNmHESb+gpVo64SwdJD+2A8bWD0o3fIPXdA2Kw=;
	b=HwQGH1JheWbbS2WOzsLS+7fRSdwqxxwDK5U7MUhF4ofbu171YC9/M4uGdb9scq+qDxiz
	 eY9/acDvT2mX4bYuJkOxbyqSoiBvK03y16uprybTPQJw/SllFMC0Vg8gSjPw3sVme5ZTT
	 HFG4dofQhOIP4zBQzl2UfEwm0p4FGo36uQ85Lln0qfckU7UN4p/uIZO21BqZ86kKSYhPU
	 10Fum82TZNlx3RDVBSl2TVk5FwBa7XCuOMf/+uyo53J2+6+XaoOfOnysTFTNYE9vn8tHk
	 tY5EfyW7rkN+SC+Da6Oj4cXT1JvEw/KkHT2y31QMRPcCSj0+GuOCvwQ0IJAK0WLF+dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=naver.com;
	spf=pass smtp.mailfrom=naver.com;
	dkim=pass header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=ui6wRAhf;
	arc=none smtp.remote-ip=61.247.196.160
Received: from mvsmtppost17.nm.naver.com (mvsmtppost17.nm.naver.com [61.247.196.160])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F664606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F664606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=ui6wRAhf
Received: from nv1s-hmac-real-31 ([10.180.31.91])
  by mvsmtppost17.nm.naver.com with ESMTP id QEm4x7SkQLWifBoF1--pnQ
  for <linux-media@vger.kernel.org>;
  Mon, 23 Nov 2026 11:26:48 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1795433208; bh=JUKnqCFlKVmNzUsmNeamof8nvtY7e99ZGb6fV7QgMY8=;
	h=Message-ID:Date:Subject:To:From:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=ui6wRAhfTXsnGvHGEGTati//brjd2/NX3CN2W/i3V7aQ9O1eORBn4liUpH7vL63Hc
	 Jl1192KRi9CZiM+ZDP1cMGooaEubE1Lijqj8Xf35vBgmLqCBhMtTpYEGPYLp+0MvzN
	 vTroNeu6t/j6yn2OQZ/GAUzYpc/KLoCEa/FkUyG7P+89Jcmlju6F3WlfeI3K4++Rj8
	 3ul9BChHG/a+z8BNmsB4ISdgBYoH5zfuGBOKyNyU3m46zl3c8rq4gnZvhk1sBjGqWx
	 vFOU1yK3wr2iJ+1f6/5qTjKS2jicyIkHIr68uTWhAMCMKpsFhmFxIOjNQ1V9XpxXv4
	 7IG0w46hXgrzQ==
X-Session-ID: 1sPL8fHRRRSUmkF9QpeVLw
X-Works-Send-Opt: 4qFNWNkvjHwvb4enW4e0bqb/aBmmjAFYKxM/KxulKxgXKBwkx0eFjAJYKg==
X-Works-Smtp-Source: PZYmFAElFqJZ+HmXKA2m+6E=
Received: from [172.30.1.76] ([125.132.232.68])
  by cvnsmtp006.nm.naver.com with ESMTP id 1sPL8fHRRRSUmkF9QpeVLw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256);
  Mon, 23 Nov 2026 11:26:47 -0000
Message-ID: <693e3223-7e6e-405d-b9e4-7b234309d3b9@naver.com>
Date: Mon, 23 Nov 2026 20:26:04 +0900
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
Subject: Re: [PATCH v4l-utils 1/1] doc: upd
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.github.com>
References: <20261121163237.46332-1-dungeonlords789@naver.com>
 <179543030033.68583.8462255388156577551@ping.linuxembedded.co.uk>
Content-Language: en-US
From: Andrei Cherniaev <dungeonlords789@naver.com>
In-Reply-To: <179543030033.68583.8462255388156577551@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thank you for review. 

1) My subject is chopped. I tried to make it as short as possible but
still clear. I am sorry if "upd" is not clear. Feel free to cahnge to
"update". Should I re-send the patch?

2) I just apply code `v4l-utils/doc$ doxygen -u Doxyfile.in` to update
existing Doxyfile.in. I use Ubuntu 26.04.1 ($ doxygen --version 1.15.0).
I didn't change anything manually. I am sorry if it was not clear from
my commit's msg. However, such work might be done by maintainer before
each release so I have provided such path for future
https://lore.kernel.org/linux-media/20261121165132.50309-1-dungeonlords789@naver.com/

On 23/11/2026 19.38, Kieran Bingham wrote:
> Quoting dungeonlords789@naver.com (2026-11-21 16:32:37)
>> From: Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.github.com>
>>
> Your subject/commit title is chopped.
>
>> No manual work, just update via code
> What does that mean ? How did  you update this ?
>
> How do we know this is worth reviewing, or correct ? Was it automated?
> Did you use a tool or a script? or update from a newer version of the
> Doxygen documentation/defaults ?
>
>
>> ```
>> $ doxygen -u Doxyfile.in
>> warning: Tag 'HTML_TIMESTAMP' at line 1151 of file 'Doxyfile.in' has become obsolete.
>>          This tag has been removed.
>> warning: Tag 'FORMULA_TRANSPARENT' at line 1431 of file 'Doxyfile.in' has become obsolete.
>>          This tag has been removed.
>> warning: Tag 'DOT_FONTNAME' at line 2062 of file 'Doxyfile.in' has become obsolete.
>>          This tag has been removed.
>> warning: Tag 'DOT_FONTSIZE' at line 2069 of file 'Doxyfile.in' has become obsolete.
>>          This tag has been removed.
>> warning: Tag 'DOT_TRANSPARENT' at line 2269 of file 'Doxyfile.in' has become obsolete.
>>          This tag has been removed.
>>
>> Configuration file 'Doxyfile.in' updated.
> Describe more about why and what is changed. Consider writing something
> like 'where this file originated from' or where you are getting the
> updates from to make all of this change.
>
> Maybe even break it down to one thing at a time to review easily, unless
> it's simply pulling in a new default file.
>
>
>
>> ```
>>
>> Signed-off-by: Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.github.com>
>> ---
>>  doc/Doxyfile.in | 1669 +++++++++++++++++++++++++++++++++--------------
>>  1 file changed, 1191 insertions(+), 478 deletions(-)
> There's simply too much churn there. I'm not reading the individual
> changes currently.
>
> --
> Kieran
