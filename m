Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795308565;
	b=4/08QyOQj1LrEuqahXzyRaD8pjwDGwT7MTfo/A4tcifjSk9iBcUkSLMD+9pI5GDElce/
	 fxO3T7nvRoYEp+Ohq/i3UoyK94Zcu2gNrlDJjEXzm81NzX58fZ+m5U7wFpydugKAgoRJV
	 qFfG/MqLr5OI+zVgzVwmYLhbJKZhplSUBKZm9oMMLvRZZS+RxHPtl4L8ZuMYxN6Dd2vva
	 UwbwR1uIXCrGv0k9X7zWYltZFLRbbq/mfRXz6StMEk8um5EHgmjdvtI6fiujCYaheXduR
	 F0nD1RydPqenoUYGTj3ROyHlkS4ZpBzkj7WGIfr/+UMlQNKceuCz3x/qwiUB75GQ+lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795308565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=HB4GGGiTx/77gkcgbtZkvnLnAdHz3bFsq58nhMt/PIc=;
	b=ilZDB+cD2LL+PWDyZ/AN2Q51yi6vQsSPNIzjVRUYpuxw2/hQVCNK1wJ/vYfZOIgjWJwc
	 UMLuf+/webZBEVQ4vWawgAQ0e8k1xHTkgCeWlt4vTPvlHaej82DyxeSG7Q0tqez7mVkdD
	 fAIn9WR0z3HqgpczRh4WCMwukPvp6IAKI9JkstkTrIZ3KpwlhNb0YhJC0jbT96zQldQwb
	 s0YoJv2vpgQ9ldDmAwaqqkdUbNVXKmTJqxCo8EZcMXoQeKxv2stpHJALYR80Hf01bPKf/
	 wxzcM9CKYyk5jbFmnvwgoNUzsU7kKZCwXwYg4rRI5AxQrtRyAqD5e+U8hvsNEDi3L4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=a+0K0Nob;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63808606A331
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 00:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63808606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=a+0K0Nob
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so6311034eec.0
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 16:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795308563; x=1795913363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HB4GGGiTx/77gkcgbtZkvnLnAdHz3bFsq58nhMt/PIc=;
        b=a+0K0NobGtz8B+Z6ohea3+PQBOuq9f9JzKTQBspnxU9MlUKd23RHrnQ/U63zDmpNXa
         310pYIZWMhbPXR3V9v3T3E9gb25EjGUCgo6dUZU6lcQpR2i2Qb00GqIqPVp/c1eY/iq9
         DVeEUVw2ftb1AYegSyT3Ty9tvWpglgfj4lj72H4b2e7qEZ8H2w3VVWUcpHX20DmyO/P2
         BpLeGSUMhO6tPClhvvY1wCdP6Q/s5Cz47oA7Qp6V91+qa7DpxuzS+Ig52i4Aou/ydtN1
         VzdYp8mXweVEJ0vBNovXjjjcjuxWXGZUeevBExCzYsvcoqBEQ8K8GDplaPpwxPICCWuM
         PTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795308563; x=1795913363;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HB4GGGiTx/77gkcgbtZkvnLnAdHz3bFsq58nhMt/PIc=;
        b=RVq6tX6ywNRbKrlweMSos/tFHt1rCE7gA/Pa3Lz7JbtgmJsws1Z58bHPLLiPlfbSTw
         QGfX8jZIWXQ+smNYZyBzCNcse7GkV5Vo+0exqva3WJ109PqKSY5GIu4WhPPH4ddxg45y
         yBm7MlxoaO4Dux7Ppkpl5sqMTvOqcIKTcjST3QsQeuCjy/BYyEg72jGWDYHQiDw2NBbQ
         Na/KRmPJL5h5RptdMo0Bdk8H3fWh6g6lTZXKp7pwos/yQMxYlwz61nahr21ZrRta7bar
         8JS52gLwN7akFGxSxq1B31+pyTAHtA1NQfyfSIy2hff+PFMhdsp0GYEEasJfjJQaN8Es
         478w==
X-Gm-Message-State: APuU4Z/RnR5vHtZGgK0Tu3AX8iKykdNbqf4i3fgPZdsPLDiI1nl0CEbY
	TuBcl/JmT3ibRlMBK2tEnapXY8ptIs1k4Ya2Ttjv3nHvSKtt35lFl6/eh1Mo5ZtrZSM=
X-Gm-Gg: AZFdTZd2Iit6TqEYBtcAQh8tvPfYtgWpdfQ7xlmlem1MjP1qan/tw809s+zajKTOksJ
	UCbOMyLqaJeLRmW5r/BWFFWz6BTKTV31VHMAYrLXrjS/GS0zN1kkKm2SUhtHJ39aAH7fTdYmlKL
	lOMlwZTt9DTxOoD/rfPSebT3S0xRLcIf9eSrVjVjxQZEU+jrV5kxZJjbnBxMCaxOqk1UpUy7acA
	dQfWUWQreJWChs+5BGphU7Tvej00mbh/c4N64wUvTw2Y4YU5qLj9B7PkIghbfZHtPIOAIGwn8W+
	2GStwwpfFX3iGtDpSSqHlZ4DqWC0/ozpH4SzJjC6q+0aOQaAW4xKRKytm4D0REvK+YBiBTo6nRm
	BOv+70VS3W7NlfGMp/sdyVv9lXyBidAzC6FkS0riU5yfSdlPAY2fpEzSHUqOv84ij4i2h2aZRTV
	KeorVRZarbW7en4PVJPqL44ulKeNHNKxB3Ndh5w8jGytbQkrnle9wvTFflp/IO88Ss4vk7hseS7
	moxi/bioVwPqZ/f+WOXfuBOSwbt3MfjgoavrC6LWSQP/2TZtlftY0m529xYzJXf6WyjG8kAw7k/
	U1jTyPPT0rI+v1XgZeT19mvzB27tFUlYfElECtdZ0ELnTF+Nle0yOhA51vaIkiirKbWoCXJeJI8
	hiMMQZ8SJ133YMcxptMPlJThX391XJ13AjY09S6m9DydSPs8t
X-Received: by 2002:a05:7022:ea54:b0:193:9aa3:474c with SMTP id a92af1059eb24-1b56d7cf637mr883791c88.21.1795308563262;
        Sat, 21 Nov 2026 16:49:23 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm17621494c88.12.2026.11.21.16.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 16:49:22 -0800 (PST)
Message-ID: <35aef1da-2277-4d9c-9bf4-cbc6094be4cb@kernel.dk>
Date: Sat, 21 Nov 2026 17:49:21 -0700
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
Subject: Re: [PATCH] dma-buf: fix leak of ctx and dmabuf reference in
 dma_buf_io_ctx_create() WARN path
To: Falconet3 <Falconet3@proton.me>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "asml.silence@gmail.com" <asml.silence@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <htm5h9oaY-vk0g9JVYJmz5XCaKe_nPoWkUJYJqDulyNvv_sAWfzSMp0T6GWt5okc8R4SyvXXpJQ3VGhetKnjEa2KGem5uCYdxpmdzUFf6XA=@proton.me>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <htm5h9oaY-vk0g9JVYJmz5XCaKe_nPoWkUJYJqDulyNvv_sAWfzSMp0T6GWt5okc8R4SyvXXpJQ3VGhetKnjEa2KGem5uCYdxpmdzUFf6XA=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/26 5:05 PM, Falconet3 wrote:
> (leak of ctx + dmabuf ref on the WARN_ON_ONCE path, new file in v7.4-rc1, patch attached)

Please see how patches are usually sent - not a huge deal, attachments can
be applied, it's just a lot more inconvenient than a properly sent
patch as you can't comment on it in email. The bigger issue is your
From and Signed-off-by - that needs to be a real identify, not some
leet handle.

-- 
Jens Axboe

