Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38078383993
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 18:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942541; cv=pass; b=kkdA0kFymOT2GinBqmReVcRDXAM0GyxbSrDnPw37hqWM5cPA7If+mbE1mikO6MW4H9UcRqVqzDbhH4WHddaDir0NlDb4BQTZI+FviA8ulQdbt3WckP4lBAbBGr0CnniFpfPKH0/eGq/8EZWG8+wdTl7NskSbnl0Wd7fMmpMG4S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942541; c=relaxed/simple;
	bh=k1mBN230EL6nza3oq4IDY8j7korHcbpdoGl1lVx5QUg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=L9fuDcPbLqb6ex1WhcSp8GVx8NamaZHaVDDmnD6qoIHrhR25GRnIrAxPFPRhDk5vr7zs/BBbQQzfKCcXY2w1TXxPaawkn+xUmwYt6YaIv+MePj+t8kte70jFsCpw9agPLOfiJ4pUWO/EucPPnWEI7jrt3eqYEGYkQRdxhyhlfMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7R2C3cs; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7R2C3cs"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso1803886a12.0
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 11:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787942538; cv=none;
        d=google.com; s=arc-20260327;
        b=iuct9zyeZweJbo2hxqaIl0c2DNM3h7O750cA3FgaChWb86R7I/Ds2bP/rvP8yD5Kkw
         tAv8tHVRNAZfVQVR6mnB20rETuXZbMhuG22m0y1Z0wODh5j07NSkwgqz8HlVPOae3F1n
         LXsg5oQgufecuUjTVuL7QnjcLlKHMoVHfi536XE0TcFF5qeOuuWWLIuogwq7xlpBqO1I
         RWWEuMihxDdgXzT0Rrg0MXBvPjY3VwBgW1e74zWvlln2Fa59kFyvJUZ0zXkuubdofETM
         HkJzaEpiSot44pEjDGu1VPPOeTgj70Q1S58hmjmN7sbSDHDHqT2yeFcEa9dH3u8TZpsG
         zQMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=k1mBN230EL6nza3oq4IDY8j7korHcbpdoGl1lVx5QUg=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=f15OL7yjKuD5bOOiJSRcs7coVKJR1ejBxuYtkKn2842b+AErDFwKFVsjvadY8cnRvt
         IoZAhCr/GvgIiSZqa2id3fwvgNkedpL9iDt0Gcx8mJH/vsHqCnvhy+U4zs9etkYS1WqA
         w3STTNeh3aXOL+exxMmaPwH3GKZznS7mKpgojfeqtdvgNDY2X1Hhz/7jkTJm0bzEscxl
         V//r87rj7ccQCDPBnniIawL2lx9cv5GDtwysSQ8ELDdlwLN8gssrgErCB03ag79UDXTV
         PiH8oQuhDjNFqC/QDZNNmMFlkwbBzCLSLz4RVGvXgQUIr+dEEX/4cz0S/2Kme2qCv67l
         qAqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787942538; x=1788547338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1mBN230EL6nza3oq4IDY8j7korHcbpdoGl1lVx5QUg=;
        b=c7R2C3csrIGA3gDbH5qnsGJV9C/GlwlS+DfJ/GxTjG7Kjih0Mlrf6CdG6gKVl+k3VV
         eVokmrLXt27TBqzPbUdDTbu3RAeQhtYfoqYdM4V152yHbWuAsGUnyNZ2mxYGm38vl6Oi
         Dlajzw8rEjEOWhRP0p27anrGNFDruElH4MvRZrdAWjyNgegNgsZwn5kIJHuPTBUicRwt
         GnWyCzoZk98eGtVUzsKrT/CXj9jawra54hMeaoZK254eH1SZ3omdpz/5zTnfUJaw0p0R
         zzsBdIWBT3Gr7EkooYu+sIwNrxjPqRCQ3QVVFdgQL19zYrNPKl5ciEzLAtX2yOti/PNz
         UlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942538; x=1788547338;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k1mBN230EL6nza3oq4IDY8j7korHcbpdoGl1lVx5QUg=;
        b=cWnh3Xia8E2nmvuMWnJqZBZP8q1soJz08Shq+qO+UavJJ0drmJpzK5NRL92idA3dOk
         s+7tcdlJ/yYIAMYWqsP+WkNHWjvGIEGAHpH+8861gg7jflCiun19sH78YY1kINHdnuzH
         DukEEigiGm8N3dnsySowfKOfKoANxfvBmjJ0/MXNvP6Z4q7In4OH1+LaVabEiH1sZGN2
         O3wUbdiNUUn4Q44TFH0QYZgk0ry7GrDlQgCm4fOE2h3C3Q0+ZEnxDaNuBLPb0OHQ4Mqh
         NMxIxU9smI1f+px++Y95cOd0nQjiygcqsdZEfoZ6meaYVWAp9bEbDqSpfoztFOduhrAj
         llHg==
X-Gm-Message-State: AFuF++kLDjU+bTlcX89r2qMQJzPQLp6GfT0s8DK9LWMMwuWNglK0Mkhi
	YJltL6pMeV/6DilM4g4PacNihBnYNrDe8ponMviEVg4TM/gz8eSCiuo3+UdrD6W+e5wwXn0wA0Y
	T4eqrkyXGjLDGOdQu+/PmVMMIqWqyocauNwjNh6g=
X-Gm-Gg: AR+sD12WjghBhd7ZHvZxD/zSH7fsClQdDmn2quwnyBmtjxnjVU/aV2pFijBrBVwx4oH
	E/4afSbUxdY8PV3iRZcfC3qykMYCbnWs8utOcM2DY9LzFUWr3I6D9ACSCET49yrbDF80Jyd7WB4
	YiIVAPE0EpruNGgrcBp39QaoQlD4JdyXKl962MwLJiSKAj8O52Ggj7wr/iK61Bv+9JvCcT5H/F3
	gl9Np+oNm6O5dLBp3DjZ+MpdUmZPfW+FWY803+EesJnITIvWVwvGcX1OZPbY9JqnDrzbEIgV+0f
	ySw8gPRQpH0XPoxGVt3YJWKxjI9BeoxPDUo37/eCo8UTzpojXngQ5yrNp9ZaEKEViSaIIxha1pV
	dR8KAtcTGDteFu4G3haFNr4xw
X-Received: by 2002:a05:6402:51d4:b0:6a3:eb58:dcfb with SMTP id
 4fb4d7f45d1cf-6a60d3a7778mr6213752a12.10.1787942538396; Fri, 28 Aug 2026
 11:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Daniel Silva <danieltsilva83@gmail.com>
Date: Fri, 28 Aug 2026 18:42:07 +0000
X-Gm-Features: AcwNN1U_ko5XZgyu1IGwNCF2dVTDrxyoflQJ8oVjmZInGIoGlbyCt-oxUQiM94I
Message-ID: <CAL6sztoxrwJtz-QptWnN13S6JGncihHk-61DaQ3YFhadEb5k8Q@mail.gmail.com>
Subject: edid-decode doesn't understand first block of secondary display
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I was troubleshooting an issue along with one of the devs at OSMC and
while using my laptop with edid-decode they mentioned something they
noticed what seemed like a bug in edid-decode:

"edid-decode is reading the EDIDs for both the Mac internal display
and the HDMI attached display, then it says it doesn=E2=80=99t understand t=
he
first block of the HDMI EDID"

You can see the whole forum thread here for context:
https://discourse.osmc.tv/t/nothing-will-play-on-vero-v/112768/22

I just figured the devs of edid-decode might be interested and wanted
to report it.

Cheers!

Daniel
