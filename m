Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621605;
	b=FCwdovN7PQya041cIWKaRoZaWpXDS8qlBXpIU8EFknGf7w7VJG4QUD1f1IoRUL1Q1i5N
	 nWJ0K1tBjEegGf0fGgecT1t4moW684euusAWrba6uNaRe3SA5FbZTVyTgr5ReULSmtWHB
	 5P5mjl8WmIVO3wk37M47P81b1yOt/+1lfALK2WQz42ZmcAO/qTZT6C+kbZQRdW7BxxJZ7
	 /Y6P4x8OxHA0iFRSCRSwmjrytHjqn7+xZNRlfMZYMCVWhdqDUwLq1CHa0ihRfFoschkjo
	 E9jZCmlj2fgvaBFSmJpTqXAF7EasjqZEGdJxU3pmQibU5/DLmgtW/cW7RpHpcQXdeKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621605;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+A86DBJxJdj3VoDt8AbeQo1IDsgfhRBhoXBM5aSsg4M=;
	b=wSKgVFKhNTR78b3dq1RhKnRWYjXq/12UTJoZkE6Yx3JVFIYzOVF5UQP2g/bwSWKwXTHC
	 Wy7nutrtJ8wMuMrEJvaa29k74OOVHkHRnh1fNb8alx9Rwm0Kd/ktey0tcOi8Sus2NmuSK
	 mwdgmE0OeJ1kSkAJhWRwwpqUso7530qGpnKZDkn5XSaWaCLKETnriMSULl0THRzADKODv
	 7Glq+U4x77nHM/liyF8yO0FsxLsMEqLqQaAeCXWnxO2Emme+Rn9QM91ysv52QsVnNDBp4
	 C3d8f2AsXP9nRsUDiPDLXAoPCIVKWS0PR75GNShiTWhX9CfXENhQ70CLplDGV1IVesQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tg5f+S+4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4064C606A68C;
	Wed, 25 Nov 2026 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tg5f+S+4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803271F00AE3;
	Wed, 25 Nov 2026 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621604;
	bh=+A86DBJxJdj3VoDt8AbeQo1IDsgfhRBhoXBM5aSsg4M=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Tg5f+S+4/zFvxVWrW2yGXNQYkWzE78DEs4f5fqYxMFsCfFZPiGD4pFRo9vS0GKwLe
	 x2BiUp/h9BtZ3rbaPs+YyviUr/8Wm4JR3iPSUSsKeYix5P4V7q7U5ip6+29OpKfNU8
	 tRG54vxV3XkVaV9h8E7h+emlv4QT4gqT4Vp1uYJCnSk2U0Mot+EvhZ6MNwlCWH+Ek6
	 TOLjL7YjLjHrQyTsHEQbpM9HfwRzL1MsZUjjIhojNMrmN1HW60DPXal/Ibbwp/UePf
	 bIIbnMw41qMdA8yQ0yF1LuwJcXAUOKvVcMQ1EJy9WU0XEghNhsjTvI5GK+b2KC+KVb
	 qs5tadrcmFC2w==
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] media: qcom: camss: stop started subdevices when
 stream-on fails
From: bod@kernel.org
To: Jizhou Tong <fqwqf@fqwqf.xyz>
Cc: loic.poulain@oss.qualcomm.com, xiaqinghuan@mail.ustc.edu.cn, 
 bod@kernel.org, hverkuil@kernel.org, todor.too@gmail.com, 
 gjorgji.rosikopulos@oss.qualcomm.com, vladimir.zapolskiy@linaro.org, 
 mchehab@kernel.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <010601a1b1b4c10a-5e87fd76-771d-44aa-9a2e-0755e5e1ff0f-000000@ap-northeast-1.amazonses.com>
References: <CAFEp6-2vZT+c9fz2Ob1LvPQBjChOpCdAYa0qAWCyiDg3s4d0LQ@mail.gmail.com>
 <010601a1b1b4c10a-5e87fd76-771d-44aa-9a2e-0755e5e1ff0f-000000@ap-northeast-1.amazonses.com>
Date: Wed, 25 Nov 2026 15:46:39 +0000
Message-Id: <179562159984.462348.2671149389120627765.b4-reply@b4>
X-Mailer: b4 0.17-dev-cdd92
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811; i=bod@kernel.org;
 h=from:subject:message-id; bh=6KLylUzsl3/fQX9NAALkPaxd8RwNBhZGe6l0BuxAQ5M=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrBwLgw4GE+m5MsdZSlM3vtEstBkYr1MH/DgGSa
 3PCdK4m472JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawcC4AAKCRAicTuzoY3I
 OvqUD/0ZvDRqehXlQkNyIUNP/pAtOLy6Ny4uUAo+HaRDp4+eLADHISnmPTmccZv6E1UfdwZah46
 uu9NhTqxHPftFiVLsWwwiHW8t7ydOkvzmGZNRfjXYKyk1Jryceny67ImoKhwDFQB8EYzCr8Cxws
 RSWbWig8G44sZ5TvxJuzI8nHsrDeap4kdOqv30EEVk+iHdMywUuSN0sirOU9TmPJwVaCRE1zxBH
 NlfjxR/jccA2d2c+K8v6uBOMycXDBT25uWf5EgHFUrLlyg8Wlh9/fubSqejriCLa+cICU/mgHlE
 dclokiSoMqv1bS7S+n1EKqyvN0UOWqHsuAIhJ4qEKVH0m1S/8XJ6OxturWxkNXdLUS0JwmPIlED
 4zoE9dDl9ZyJ8bq7+Ma5XKIG84dey0dFsAuT6LWj/HOtLRgE58Uy+RixW6aWvjge8cpHIq0ZYsX
 LjskaMTnytf4qDpAgRKyyfTjuLvtR1ldysQZfP1LfIbpVuuDtVi0IJppUK9pvNK/mO9hKpWlCOo
 rO2ChT6tGPsnfh+dWIUv2ftyfhge6TLLcf+OomKmTvHHji64NWNIhEm33RnBzjRujcuw0lYO+DG
 sveBqQ31SluJV0Yua66P9MipEIQ529A3KbLR7zHzh9NM5Lo1AKLYkpbNfJY/zZRphgHYrF7Zv3n
 h06qDNu0+nmP4iQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-11-06 16:32 +0000, Jizhou Tong wrote:
> Hi Loic, Qianhui,
> 
> Thanks for the pointer. I have read v2 2/2 [1]; it covers the ordinary
> start-failure cleanup addressed by my patch, and sharing the traversal
> with stream-off makes sense.
> 
> There is one remaining difference: camss_video_subdevs_set_stream()
> returns immediately on a disable error. If A and B start successfully,
> C fails to start, and stopping A then fails, B is never stopped. Normal
> stream-off also stops walking at that first error.
> 
> I reproduced this with the actual helper and injected subdevice errors.
> The increment below keeps the first stop error and continues cleanup;
> start still returns immediately, and video_start_streaming() retains the
> original start error if cleanup also fails. It applies on top of your
> v2 2/2. With this covered, my earlier standalone patch can be superseded.
> 
> The helper and the actual video start/stop functions pass 416 ASan/UBSan
> cases covering partial starts, multiple stop failures, ignored states
> and pipeline/format errors. With the unmodified helper, the stop-error
> case leaves B enabled. The ARM64 W=1 camss-video.o build passes. These are
> software tests; I have not replaced the running camera driver to test
> the combined change on hardware.
> 
> Would you fold this into your next revision? I have left the multiple
> source-link question to the existing discussion with Bryan.
> 
> [1]
> https://lore.kernel.org/all/20261031041154.308030-3-xiaqinghuan@mail.ustc.edu.cn/
> 
> Signed-off-by: Jizhou Tong <fqwqf@fqwqf.xyz>

This is another valid/good fix missing Fixes: Cc: stable

If you roll a V2 with this change separated and a little less text on the
commit log that would be appreciated and applicable.
---
bod

