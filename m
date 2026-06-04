Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2255075801
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 04:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780545736; cv=none; b=Uy8pbW25LSnj2MpWUxvb5jj/SoNqon7kYQk8/pBEzuJrNvBGvgPqxbpiV/sSibiQl+SDMQhSh9w8nAo0l2I2RHJiJWgr7U3VrlOxG1hUWUOoKJNWSOcsNl4Ws01+Wto7roDPz2OnN0h0nMhj4QrTJ9LGJuPYkfwsixAFzSCfFuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780545736; c=relaxed/simple;
	bh=+LUW6SdAuD4bJucZBC5ZXb2SfLYhPcCADPaD4tsidZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RJVgG0aKj7T9TTnjvhtNPq4fLDLJ0BoLMBb6ycwusFyqI+mVh2K5XRX1Jzj2LypHtFF4NaP9eh4lHK68hJE3gkvN1mbDeMKjNIvzi5xiS4EGRlr+W23mHtNm6Ke4WzDwWA4Dx2bqOmGazHfGQtRpELXbZwthidWCBb4PljC8TlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZed6zlC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZed6zlC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC541F00893;
	Thu,  4 Jun 2026 04:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780545734;
	bh=RVRHwUs8FzvWq2sIKF/4s0Nt1Bc0QmD1zE9Z39SUgGs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jZed6zlCLM+dV+bad3iWO6DKTuyKE69UKK0nYtMVo4kdLH1WDd5qTKrySJCe6SJTj
	 rfD9y5dhCfJy3CbNKlSyjmzTAirb2JPAdVeTuhWRUVyNfOLU6+aCSxxG8FfR/+E4Ls
	 nZLTtcl6ARTav/dBgTavKht5lKSaPQezAWHjaXz2M2bCLudvIWfnwdb6k9TyeMlSWw
	 6GbNNOz6SA2pbEQlU6kKmRwg0ZYJ4OsIi9vKT9rXgdxHtUMevJq0hCMntoW8uCNriM
	 j+iBLkCnj1Ir2Gdgv7sNRwYadENxzZro5SnmoGrlHvrNs32SY9/v4VCjn3jRlsn4dI
	 m7Pl7SWgCo8GA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] media: qcom: iris: fix runtime PM reference leaks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604035133.39825-1-dennylin0707@gmail.com>
References: <20260604035133.39825-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 04:02:14 +0000
Message-Id: <20260604040214.ABC541F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] In `iris_core_deinit()`, the return value of `pm_runtime_resume_an=
d_get()` is ignored, leading to unprotected hardware accesses and an unbala=
nced PM usage counter if resume fails.
--

commit acf00d2e310620bc8e8cebd99a624ed3e592b957
Author: Hungyu Lin <dennylin0707@gmail.com>

media: qcom: iris: fix runtime PM reference leaks

Use pm_runtime_resume_and_get() in iris_enable_power_domains()
to avoid leaking a runtime PM usage count on failure.

Also ensure pm_runtime_put_sync() is always called in
iris_disable_power_domains(), even when iris_opp_set_rate()
fails, so runtime PM references remain balanced.

> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/=
media/platform/qcom/iris/iris_resources.c
> index 773f6548370a2..f5e3341e14309 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential issue
in drivers/media/platform/qcom/iris/iris_core.c:

void iris_core_deinit(struct iris_core *core)
{
	pm_runtime_resume_and_get(core->dev);

	mutex_lock(&core->lock);
	...

Is it safe to ignore the return value of pm_runtime_resume_and_get() here?

If it fails, it returns a negative error code and does not increment the
device's PM usage counter.

Could this lead to unprotected hardware accesses when iris_vpu_power_off()
is called later in the function, potentially causing a synchronous external
abort?

Additionally, the PM usage counter is unconditionally decremented at the
end of the function:

	...
	pm_runtime_put_sync(core->dev);
}

Could this cause an underflow if the initial resume failed, leaving the PM
references unbalanced?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604035133.3982=
5-1-dennylin0707@gmail.com?part=3D1
