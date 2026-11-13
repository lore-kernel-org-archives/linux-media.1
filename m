Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794559660;
	b=qfNYGKEvxbrFUdYwvg2YuBDop7ojJFZmJhvciyy7blfOtgkeuMHagRJ2CDTJS/CZkqvA
	 BNnvn8lCYEjgZpAxo51Fl3VbUUjOsIcdkwG9VNgrwAKxgSpJbPMAE3VyLLbHyoP+1Cfdz
	 I38MCqjifUGjR7pL5mpX8E1+7gpfOklJeJgINeWCunJczGwGoNX5vfsSngNPyqWEseBsl
	 plZ4X9FWV7xqwvc+4jDd5NCh+Ye9DKFh3Oqf5xTAlNjdDYXHUb3xMhDiKvem14/U2JesW
	 Fnipr0LX3oy/OQfEGQKM3KGp4OIv3BBxKrNQgnF/Cu3KvIUuCtdj7qbzyD0HEZ9wC6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=azSFDpVZXB51eI+O+xnDaQ8WpvOeiqvQIg1S+9gDSz0=;
	b=yc5NOYSOToiprD56V06bS/BxF9DIycTbBDT4sNHE0HeW0e2DokU3+q5vGv7TDMeet4FZ
	 25QoZ1cUON4esZwtrAwe7bwmEAR0NkSSJcZNc5OFGGqBCLyo86rjdT70mMsT+3Ajo167w
	 Nk+Q9YJftzI0RBPyc6A6wmOuckTpFUpbpAcp36u+6Lv5HfNZfsLzC0NHBSrVe4fA0ZAzy
	 PET2KVvH3NiJOUg94id/NUdnL2UrrTmZ6L4k/ycCF7vKkrItmir1Ox2FmsF1llMdhW6X2
	 qOfj1dT9Y0hV9QaUnwEys010mh9gR/oXB2CeelLfDonHduQfmM6R1h10VmzBDlnFqMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U8DsRapK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00C4606A880
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D00C4606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U8DsRapK
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c05727a58aso61861e87.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 00:47:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794559658; cv=none;
        d=google.com; s=arc-20260327;
        b=hOU6d07+KFqpECZrpLHNpd9uZVVcD/gqrKjvSgfqi0/biqXo71kqRbPYXsa3frIlHr
         ALjM9QVsXxq3joh4uhWJ1H4G9qCy9p2InoYp0ry2lTKEsH2q7Gz/VrRB8+3QCpO8JHTz
         Vys38d7St2K4fDqdl366YqGUGaibiv/3O8H2dWBpTH2nkHKBcAF9RnSx6I6RBwL8YDiR
         XV40uvhx/0rNS4P8siFTKahn4JItf6/7io1L7zyv9/b2qTUyv/QEkO9rXasbEVe72Kkk
         rjIuTluHIudr3qFdKt8GRY2eS2nMfw2jiif0xMjJVjhZsVsADpgrQcIuIKFYmUavqdxi
         p/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=azSFDpVZXB51eI+O+xnDaQ8WpvOeiqvQIg1S+9gDSz0=;
        fh=146U8ZhuxqQdfhxPF1izTg8Tln68UBvkO2yciuVWgtY=;
        b=qTkWofAvcyX9A289hN+RCaZgXKEWomCyiBtfvIqyk9W+ornMrxVGyah8zF3egvs2iq
         Ck5aLaq0RIHxzWW6ez5vLZELGrxzGGbOeUHW+ht97IjkxqlEaRZv7/9m3thHzBsYCIvO
         NDg50dSULzYpIOCwuZV3j01KUVCOGjhCub1jih3qxWfQ3RbgW6DJ5BQlzRuMhjdiQcqZ
         7wneRKD1E8kWhmRPdXJ3yszAa9CY3T2mPvOqocicrNoyCXK5v9u4uUdkLUwQkpFOyNg5
         INZDxRSW0tFvY2rYfyKu1Mmq/ZPM0Tyr9iE1pgC8+yf47Iw6NMzbL2+6olNEoZkEQCBi
         94GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559658; x=1795164458; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azSFDpVZXB51eI+O+xnDaQ8WpvOeiqvQIg1S+9gDSz0=;
        b=U8DsRapKhGR6vBtLH1thXXwXyZpaVgkNx8gLA7G5QxxwXy5dWJLb9CQIMb5BJC35RT
         bDaw69HrTzEuzwNOehQ4t8T00pBe9GeGgw1AUYbdrmG9cGfby6iYukW2MLBHkvVxIH43
         U+pgoZCY4d6k5uAI9Pv5Ip41cayoxBkROgo3e+1kMwLbNzEtgThbZnJEcPWt3/5/dgVv
         AY1r2y7PFPZ9oPtFSjiZDnVwQ1IMMFFZmcIhJEKydSJir0H9dkM8jmuX/CQP4WozFXR5
         79bl+iZSliQBaiAFbeIETVsBaizYJWDFJNyzPR3x0jV/BRjbAHLnTJdH5lmoxqza/kOR
         Orgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559658; x=1795164458;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=azSFDpVZXB51eI+O+xnDaQ8WpvOeiqvQIg1S+9gDSz0=;
        b=YJyzu8l2a2TOz6PZBaVuz0mYoLAxpyG662hEESP8sIVNjLkhr2Iox3ueDova6LjOTt
         hYVRbxkJ53+F96uWmbuupdh1iFtOfl1I8MpzcPmtKucV+5DYlMGLk1gJMlVfF+5R7jNU
         GX5rLWNEOVLQfyiRjcB3Z/TH34LGaIJ0ZFC+8QqpIJDf5g8bNJalY2wRuqsig/Ql+xHX
         rkDR/EOSBTc1LSj7/XAVSo09fSTllIXgCXORx9mjB62laaev6Fi8RI5/ovA1XnSyG9tN
         AqgXbTwH33P1EbZ8n9wJXZJ7JX0SOwA0MyOgoTh85GCwHqfLY8cEEsKarcyKIZWBSS4Y
         qJ7w==
X-Forwarded-Encrypted: i=1; AL+hErHtgNemQgT2GYukpe3DczYoEVZVcgncOXpr4IbO2Hoj1zQv3+/4z4m8SpgyQTlyCGj9Nsc5vQT2uYkXBA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9HRxyrFoXl/miZneqIzFeVrN03WLYtEUzL8jSdwBH9otGhrqbI
	ffXbTGZ+/s01oolV3Eqg7aW3UyAvZyJZeE3Qz8k9v4cM0MnHfSSqlcmmjw86JeqO6AfRm2xlfAV
	GSRfJ27bC4vwtyTlUf4BtLmHLkgt/ZrM=
X-Gm-Gg: AYBFou2tMYQncVG1DquPGiObCPVjCiXAsiaKIAOiWl0WPEB5EylZHGvg/e73kx5SHVJ
	eszXUp+a2euDrF7sC44N+JR+8WI1N5p3816K/cWp32Ud1wJ1yJXfvdc80l+lCeBO4bcz86W5R+a
	nmgkWN6Erj6bw0RC6VrDycGF9pkWtCaZYCn5K9LIpM57qd3+xvdfpSgx8Jpwr3xwcBxhntP3BbC
	LdPSFdbVfK9PMB1tpmu9714Gw1ZC+5Tj3klSuALMMaXoh7OuamEomQnw2unmB8z1mAM7FToVeWw
	p9PkQUk0WmlpSAcmmunO7po23gEDATUchF+uY4Z0Q1iVPBq6pRU9sGjdPc4RNsnwxXCeRUFdLkK
	Xls8j8peBhgcq7M84T1KIe3X02d3Ak1at96yT7GegypdftHt/noF9Hg8FFzQhG9odfw0amifQ8R
	6UzGysvGaYdsGXc1+p
X-Received: by 2002:a05:6512:1313:b0:5c1:57ce:d4b4 with SMTP id
 2adb3069b0e04-5c1707406cfmr1016874e87.2.1794559657809; Fri, 13 Nov 2026
 00:47:37 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-h264-encode-fixes-v1-0-7a64486df499@gmail.com>
 <22f2ec2c4994b36850656dfcb4dc5de09a22afa7.camel@collabora.com> <avXnVapZS61WzrIT@collins>
In-Reply-To: <avXnVapZS61WzrIT@collins>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 00:47:26 -0800
X-Gm-Features: AclHuK8Y7JXh7pq7VFgpfhfudyX5K_zDruS8BAn8__lqy64gnN7bBE__xRZhpbo
Message-ID: <CAEy9hNV6zDBE9HJ+sRfTTMy+FBnwWaYXf8UuGUCNq4CeQgczZg@mail.gmail.com>
Subject: Re: [PATCH RFC 00/11] media: h264: Stateless encode core follow-ups:
 parameter sets, POC type 2, CBR and VBR
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
	Marco Felsch <m.felsch@pengutronix.de>, Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

> Maybe next time just share a summary email with different findings
> and ideas for improvements on the active series, instead of patches?

Will do, sorry for the noise. I'll drop this RFC. Findings on v1, in
case they still apply to your v2:

1. rbsp_update(): the SPS/PPS change check is inverted, so the parameter
   sets are written for every picture.
2. SPS and PPS are written with nal_ref_idc 0; H.264 7.4.1 forbids that.
3. Only pic_order_cnt_type 0 is accepted. Hardware that writes the slice
   header itself (Hantro H1, Rockchip VEPU1/VEPU2) has no
   pic_order_cnt_lsb there and needs type 2.
4. state_commit() publishes the encode params before rc_step() sets
   slice_qp_delta, so userspace reads the value from before rate control.
5. CBR on a VEPU2 (1080p60, 2-16 Mbit/s): bitrate off by -8.3% to +2.3%,
   and the first P picture after an IDR up to 20 times the median P
   size. Causes: the P target is 0.8 times the average left in the
   budget, a size ratio of 0.8-1.25 changes no QP, and I and P keep
   separate QP histories. A model after Rockchip MPP's frame-level
   control (one QP state, size targets from a GOP plan with the
   measured I/P ratio, error spread over 8 pictures) gave +0.3% to
   +2.3% and at most 1.4 times.

Arun
