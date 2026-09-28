Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E545247141C
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 08:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583504; cv=none; b=BA34X+Dxp2oZf5cAi8keTbhTW9cwlBIeAVEsRQBj5tHNH37Bl+5c+Th8YSbljqlsh7zqfo4nPTnbhCP8/FLNEvybKmLOZ2YNp9/rkQKo6qTYkpv54GErCJUDavC3iTkZZnn4DekzphivUUO1I1+D4gyUF6r0eweRtTJ4Esde+6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583504; c=relaxed/simple;
	bh=HUMvEp0GsnnDenYqpEFIIFZlpP3VQa8nGaEXPGFIkIA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=itdjnqynwTTEErQsMVn+4bYLb1+V3ge+crr2HD6Opvdeaam5wTAOV20I7FZppW7gxCb5MLmpNjwFtBpoMSPVsyzs8wrG1pkVsqmVpN2y2ZSudKgJdmQ3ILPYtq7LzdMkquv6aBIxPqylwxFJlxbVIQK/BBT4ShW+rxJwOhaSKrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrQbwaJ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrQbwaJ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB31F1F00893;
	Mon, 28 Sep 2026 08:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790583502;
	bh=mw9KujkbxMyfkew/BSQVSyqipPHx+VtdQeONjEIbOkI=;
	h=Date:From:Subject:To:References:In-Reply-To;
	b=CrQbwaJ9l3vCqd3wB3eYqFsuxjBn/xTGjLiDSewqfqL/wkM+Z9LmoG45tQvw03+me
	 9BrLt4pR9/8NDWk+Fywmc6VallmubqyklCv0kjmsRvRyJUEAwq+3XIBTCfr+7T3yL1
	 d/Q7ti10a/zEgwFluYBRf16nRbZeGZPlnxK3xS6xdNThl5xCWNKjZdkrSBPvc4ZIyC
	 EaGS5JXBUacDHVll0vMjr8+e90f3R1KZPVJTujvGD4IVD4GTMVUdHFraFcolcwgh72
	 Wt7d/EJCUztWzAvVts8ORi7KP8F06wGc+EyWHgjnDrpYAoyY+7n3/5eazP1Qg3w6TB
	 oQ5mqmdbH8MKA==
Message-ID: <e9e171d1-9449-4d4d-bf65-efaf9133e0e0@kernel.org>
Date: Mon, 28 Sep 2026 10:18:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: edid-decode doesn't understand first block of secondary display
To: Daniel Silva <danieltsilva83@gmail.com>, linux-media@vger.kernel.org
References: <CAL6sztoxrwJtz-QptWnN13S6JGncihHk-61DaQ3YFhadEb5k8Q@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAL6sztoxrwJtz-QptWnN13S6JGncihHk-61DaQ3YFhadEb5k8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Daniel,

On 28/08/2026 20:42, Daniel Silva wrote:
> Hello,
> 
> I was troubleshooting an issue along with one of the devs at OSMC and
> while using my laptop with edid-decode they mentioned something they
> noticed what seemed like a bug in edid-decode:
> 
> "edid-decode is reading the EDIDs for both the Mac internal display
> and the HDMI attached display, then it says it doesn’t understand the
> first block of the HDMI EDID"
> 
> You can see the whole forum thread here for context:
> https://discourse.osmc.tv/t/nothing-will-play-on-vero-v/112768/22
> 
> I just figured the devs of edid-decode might be interested and wanted
> to report it.

Apologies for the late reply, I only just found this email.

The main question is how the EDID was read.

Looking here: https://paste.osmc.tv/melucavigu.vhdl I see basically two
EDID interleaved. So there must be something wrong in how the EDID itself
was read. edid-decode just parses the EDID, it doesn't read it (unless you
use the -a and --i2c-edid options).

edid-decode could be a bit smarter, i.e. if it encounters an extension
block starting with '00 ff ff ff ff ff ff 00' it should just say that the
EDID data is corrupt.

Regards,

	Hans
