Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391923;
	b=0G6+HKxrW2KOUdmiJ/Emh8JtpgwH2WUhqIqz2y50exhxT9yajSISZkD5uOSV+MLeV7l0
	 ztkEUKq+hHdZCGF8d6JsBxPH65dZEMVbzZ2gLPnhRnOJKSdETZ7tqWkdnR+Na8Q6nfKWu
	 qnmodvXMffMz441bsrSUSIBKIb8jYynsxXPkHcyR8iK4fT+qBGXVLFf2w5wssTAYqavlF
	 L4BSa+dtF5TGY53wCxjcZmQipNd9qC08MM5kvT338d2YzUt2vHkehf0wZcbcQ64W/Bfuo
	 YM9WeYnWR6nn8/EfqOfbZYllvchiuY4orAKW85+gN4ALtFrz+6Lf58CDszPwiN0uQuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391923;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Content-Language:To:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=0MIVj1NBvf9V8PF3PV02tEEx9CoR9m6OpPUzGespDMM=;
	b=TSqXgy4nGIOjLBO2Ys6J/b112pevGeGTFJ8n80+mE/ZQiwveYcwpAXy8lnXu2qmqiO5Z
	 RPX0tmvbCXcmjMrOy5q/4zEvp0DVrxFhQxaS6nO2mo19zv9Zni6tt9KVRMoDaMEYcLlcz
	 Ly8t7Gi8jd8uRxPQHgizKBQvX0gGgdVc9MZTO3LpcHzRi0PHZP39/D6DffdrPy7PlWUVd
	 HJRtyOi3Q/0PbFjEsv9sgAfvZPgAe6wB532faDWMmxTxYZGBw4sBi/fJqDHC1IcG9a7g1
	 trmn2gLqPG33KOQMNfJ6SBn58T4eTxkolkIRpp0btyCOlWeTjNgxuL2NpMQ86bnm1ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Jrw3GvZ/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E245606A327
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 10:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jrw3GvZ/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5AD1F00A05;
	Wed, 11 Nov 2026 10:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391922;
	bh=0MIVj1NBvf9V8PF3PV02tEEx9CoR9m6OpPUzGespDMM=;
	h=Date:From:To:Cc:Subject;
	b=Jrw3GvZ/lG30o4/fNhC9rOX/BxlelOW++1MeYrBKznZmvJbjtyaIY6twZ8xpm5Qoj
	 Tdiic0ux9E0eXDsulZDmt/maC1eQNtJTP+RJt/CtvDLYs9pLKxVAmPkkOBSbmCVU3a
	 Ue0fD0q9jIYFL6x4gQB/pu/FZ69tZj0RG9WO1DKHoOQr2n0gz4zcdNX/22OVQ8OKtm
	 JmM0jmrR/MV65tYzu0CyaHD1iGUqxby9Cd17Gk3POspHop7m9lHQRtXionjM8CnRfv
	 Rb38N9yJwjYnPolwfwiWr0w5F5WL2OWnIOrWJCWBnUnA1MSkBL9Wa2RUd2Wu5ZfyZG
	 D+RnyU9kr7b1Q==
Message-ID: <adeb9e3e-ba93-420f-a9c6-f56a7d3b6bbf@kernel.org>
Date: Wed, 11 Nov 2026 11:12:00 +0100
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
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [RFC] Media Summit 2027: one or two days?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

I propose to again co-locate the Media Summit 2027 with Embedded Recipes:

https://embedded-recipes.org/2027/

That conference is on May 27-28 (Thursday and Friday), again in Nice, France, but at a
different venue.

I have three questions:

1) Should we use the same meeting room again in hotel Campanile? I really liked that meeting
room, and the price was reasonable. It is a 20 minute bus ride from the new ER venue, so
that's not too bad.

2) Should we do a two day summit? The Media Summit from this year really had too many
topics and we had to rush at the end. So either we stick to one day and I have to be
more strict with regards to the number of topics, or we expand to two days, but keep it
shorter (e.g. start at 10 AM, stop at 17 AM or earlier). Stopping earlier also makes
it possible to split off in smaller groups if there are specific issues (not directly
part of the Summit) that people want to discuss.

3) When do we hold the summit? I.e. for a one-day summit do we pick May 25 or 26? For a
two-day summit that would be May 24-25 or 25-26. I suspect there may be workshops on the
Wednesday (May 26), so keeping the Wednesday free might be better. Nice is not the worst
place to spend a day :-)

Regards,

	Hans
