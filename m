Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094107;
	b=1fS8Rs+UJ2N4s+m1iuRVrbs0T8V2FLvw2p80qU0XuVsHxovTEdM0qAknqnoyxlqt+JOH
	 8NQq1y0WjbnV7JmXnOtBQNVuESjN021cYApv7FkOBpK7D+FaIGySAlNuiEa2IQTcBESQn
	 Y3fLmzcsecFcfX92IHb9P4ehKprmhNa+4hx1jdE9XePURnipRrx4xBgI48ttgmtmPpPSD
	 /02anFd142fd9zGLTQFgWiaEg6+bcg9Pmyl9VoZYt6vKFX5eJEWblvS+vyeSbt7CvhFgt
	 Z/24MXB0ntawFBrrE+dlUt1hYUN373dg9nza8GLsCHqToXORZ8t5PSa0Q+tq+e9JM0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094107;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lEDLl85riB4xPGlEuQ4qjTbcWJ8DirKFoMcRnSSARDg=;
	b=lD8l6J78kiXFpaV7lDOdE6e55Ab8Qa6OkUOjnIDAJUCMqEKhGZ77coe6mvTJa159Sbcw
	 xB+pMbmbqBUJJhx8CxtYgsl1TlsiVcB7MD6Yldf2mF0Pg4kz5DT/lfjdXmTyvvUXzUF6p
	 YQ0d2bFOw7XoZIs0A6+/eqqFKMC+3x3jpRuXZdRrBHKQFtVzmSV7nwtg8Yn/lvY0GUUCu
	 INeSWoUmceuhs63UD9y2ohw5+Qg2gDxtM4QBXMbaA5WYCYbIDsOICcuXyE7tdhBgYmeGH
	 +FBnk/9ymiv7TI9qHFEXmEGpgZsu5DtjPQdIOo3/+FWwxgKR0LQbAT3onsfQh36G+RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzRctfuk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7391606A320;
	Thu, 19 Nov 2026 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzRctfuk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E5A1F000C4;
	Thu, 19 Nov 2026 13:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795094106;
	bh=lEDLl85riB4xPGlEuQ4qjTbcWJ8DirKFoMcRnSSARDg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=TzRctfukUjjV+daL1Sr5I4dYsBqT4S/AiduY39QTdJiebhdz5s3qSrtN4G83M324z
	 epAkTZXI4caApBFhpnmHaZxY+4uvhgfNqMSVhpmKD/+4OpCxe7zzw89PJwd7Q3X/+0
	 dgcwwTSrYgGUH3vWcVjd4BeESFjR+BS9N3bqgnveo0os03SiXC8C34BkXUP4n+415b
	 LXVtj4CLkHKLsQGUkeCl7DKDeMFvvodaOiZwT/Tkfewh5y2syuZ+HTX84DyQUqHlm+
	 9K3fI1e4wjf4BgaoBVfNFzrrBrPYs5Y/YJjXEzL4VicY8iiCqlSLXqtfbgcPUPvE/T
	 wwe6SeEia5CQQ==
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
Subject: Re: [PATCH 1/3] media: qcom: iris: improve probe error reporting
From: bod@kernel.org
To: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, vikash.garodia@oss.qualcomm.com, 
 dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev, bod@kernel.org, 
 mchehab@kernel.org, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261106153126.120858-2-dipayaan.roy@oss.qualcomm.com>
References: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
 <20261106153126.120858-2-dipayaan.roy@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:15:00 +0000
Message-Id: <179509410068.2846709.17530660529486059800.b4-reply@b4>
X-Mailer: b4 0.17-dev-e3fc9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=bod@kernel.org;
 h=from:subject:message-id; bh=ks5O1DF7yijV1FgoK9RnK+vAJwuKluUd2GhUI5VqS0M=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq/vZUirFQGP9Nm5wVNwPaWxEqHPbAebxyBmYFR
 K6VSsUQumuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCav72VAAKCRAicTuzoY3I
 Op9ZEAC4OTXpN+oBubDcAJlAZsMAbgz+ufqXZec3Gs6j0Rh2VTAemYDSWSdBgL345XXsczAc4cR
 L99cuh2VSJ8Rtam0ejXgM+F6MeefuTeBRZ9PzoUQW0QdtEBwqpgFxSmpszUi0ocbkAf5hDCex1p
 70kD8n3gbNZ5I/PyoLkZ7KvSmw8hnxGRip6OWShFiqfAkTuNIYjEyUQ5nSZBouuJdta1/oQ4gjp
 bggyG1+iMxsvMd04u79D4FNmWHn5d0aIvzCn6IwFn0xZ7Ojf8zgLCyblCC20nStDhp+I1HNDkE5
 CxGBnYNc1EHxWtp5PMWuSaE/C+WEgdZpytk01G/BZ9Z5oSj45+gJ4AsrIhpOXJ9dcNo9/mA6g39
 8dY2Fl3SM31jfS3nXsG12BwruERyY960q+dJISii953aVZAYpSNXiljhS/otPyAdrf4Hq3d/gIE
 4GFKh0B+zYVlSE4ebFPngWjq1RW+v4awyy5tN9jZFZ2mnCApSnjaisilSWgLYZ6mCFycELMgOq6
 VD9I7UgXnUwWW6kvx/rS0ZdExeSCGJ8z8nOc5YKEgDKbAwHzKdIB2vbCvxV92s7pmRjSsb2E8Tm
 Vk/a90DcsKR9C1bEkMT2BGTZgjV820PCjyuEwPt8Xgw1Zi8WGyICPsulScNkjflAdmHxXtPiAiM
 uoYxAUP+5MYrFAA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-11-06 15:31 +0000, Dipayaan Roy wrote:
> The Iris probe path returned errors from resource initialization and
> device registration without identifying the operation that failed. This
> made failures difficult to diagnose, especially when several resources
> were acquired during probe.
> 
> Use dev_err_probe() at probe and resource initialization failure paths to
> report useful context while preserving deferred-probe handling. Also
> validate the platform match data before it is dereferenced.
> 
> Successful probe behavior and existing cleanup paths remain unchanged.
> 
> Signed-off-by: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>

> @@ -220,18 +257,18 @@ static int iris_register_video_device(struct iris_core *core, enum domain_type t
>  		strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
>  		vdev->ioctl_ops = core->iris_v4l2_ioctl_ops_dec;
>  		core->vdev_dec = vdev;
> -	} else if (type == ENCODER) {
> +	} else {

This change isn't just "fix the prints" so either drop it or separate it.
---
bod

