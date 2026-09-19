Received: from mail-qv2-f10.google.com (mail-qv2-f10.google.com [74.125.230.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618E2314D06
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 02:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789783888; cv=pass; b=UKPD7bNC8Ak4m95gxIk1gUPMvUcii7Or7Wvs+xHllQOZ3rEVWWZ1XrREXaAsXsHYEXoKG7zyE0OWn3fiwPePff61qrWi09spwKW/LbpFpE2tEgCoE400xBJ3Kpr4v0RFyinTDheayAWvT4EyR+LMm1GQpXsYDhFXAFW9Sxe0u1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789783888; c=relaxed/simple;
	bh=i0gr0Mz3zTuvwDzvwi5Z8YQKCSLrKjrkqOa9KrO6j84=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AecWJS4gsYJ/tHfc0g1iILGXohQgZcLkk0KmeFsUOUJEXaDZz5iqbWRfQxFdQddf/J02BWWspb6t+3BrbD+150Ii/9mXEwBr/oF/ctLdW3WLfDjQZaWkGlqs8Ia4DGVMEbiHg7BWCxTXgnjdEXux//dzOezBBhnPM0IACWmt0NA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8rKbWKc; arc=pass smtp.client-ip=74.125.230.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8rKbWKc"
Received: by mail-qv2-f10.google.com with SMTP id 6a1803df08f44-90e817556d8so7291716d6.1
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 19:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789783886; cv=none;
        d=google.com; s=arc-20260327;
        b=M+0+NG2o5tZK9U5o801tIXctGe+UxZc2ASYo4Sm90ZMZddoukOZv+R3n66dPR8pfZn
         X3XFwJOGFC2PWTUDKKFP0IlJ8Q8c+MJxpC20Eb4zHL4htBW2op/UQXSry3uP2VLxX2Nl
         qvGgVlq/Y75yUY8AbLfwKFckj6JCAN3WosL3EL5pMPziepYcA/YIt2kjX977U9ZZviJY
         RnDuyEbsFk2w9KVY6qbz4QAGPrTHqdhoV2W05/jjuADUkSGboAM1QtI2R6kEUpgt70cB
         p/C7PX3qZm36CWyouBKUT6o8qpYohbUsbtgsdV5NAPn34iqwhafLUn4U4phQ4H6+q/u9
         M/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=AtaS6En83TzP59PZVbj20vz/Cj/z3JfYotNYtq8PsDI=;
        fh=eQiAJSQvkxi9+UKhY2o0RyltHcrepVz7EKKMc9v5gSo=;
        b=m711/nEFicWkOT8cVGQW3BV2wJLyIYx6SU0OcCz3uGOGcKSryCtyTn/NclT9IRGXB6
         ymxeZtsTIGJOkfaP6EFXJvN1T91Wy//bsvwMfikwhbJY0R8UDwMOvDn7Dy0+Hwj6mifB
         52zoO84S36t/s7m6SLox4IQiYXDlznxfOUczn7WBAUIYrpQg+hIexMbytBNKOim7QyL8
         kycTq58kTQrkWQJhBfXAwe7kix7t/petBfoeckY/xZgveg6iGQ0q9j+gudBRYyOohp5+
         Hw3J0RZMPZGpK60hjgFawyBaeJmLpGO66gXpqLGlytErmvfh4cqmLO71b1yD/EoXPZWa
         zv+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789783886; x=1790388686; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AtaS6En83TzP59PZVbj20vz/Cj/z3JfYotNYtq8PsDI=;
        b=Z8rKbWKcSO1iJcN/tBeo8YP9wg7accD6+2PS0tfDriBwwDuxN2sy9aPp0Ozy7gr4V+
         8fBbTeAf5UxwiQHllSDPWV6sivynCRyXSAKB+mvL67Mtd/Br++oojuIhOMObbGRZAgkw
         FgFCcUg+03t5imoz7ocD6yR/u7jDSJcnpiPusb6K2krBnK6FqLRNCwAAB1SkqTwA66up
         IxzH0z6uwKRGSQ3+etkSgZkMBM6vRW/cWQVU+tM66S+dKB8XzkoNM3+1JAQHwnPs7dJ0
         X4OqY+DGpRliBDpZd2vZrUhjnRiwvQmqvSMo4vRxoq29lSQbptR58qdv4FomTMGGOsG+
         IbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789783886; x=1790388686;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtaS6En83TzP59PZVbj20vz/Cj/z3JfYotNYtq8PsDI=;
        b=ZZQbRaptQeYVgPZIZCaJXSJvGpWrO8jvf5Gd+27MPu+AtqYyAchPiC+5TRPt9aZuDZ
         JVEdUWVS0IEndTKGxfC/N81cFBmzj2AXdPuY6RlY+WDjXZzg7vE043gYJnBtFU8Vm2+X
         BVY3gl1PBttjPpint3Iam4OVbLwoHLogvgv9Z1iWkcQ1lQ8khcO6wTc1QWaDHsBVHLX/
         NoqKCmjzuGqdPEB5+WD9BPtAOHUQo7aNAXTDg70VZep8FUqy6VGaREn+EnlxjuXQh70w
         PHcfOFE/k+UiPQ3MxYZBk2RP8CSnIJOCp2eFaYnBtH4DoZGV0YCbB/PI0VvZId62Joy5
         oD2Q==
X-Gm-Message-State: AFuF++nrNjdCKLO24tj2N90v+QCBIvJaZfZdhx8zGcaJwrPoYnmYyaVg
	icT4IdBFexKDGvQroPsor2l+ZoQd9vAuLaBNZrtOsLmOWfYRe9B5PjvV9a0G7+MHfPX+qUf9lXC
	8FiKddA0VlKG+lvh1On3290IwTFw0OrrXxmq7mb/kxw==
X-Gm-Gg: AYBFou39F5CzmplUXd/UdUSitZ1+Dg+CXdzg5IOr2rREAZTXkJ2WhoP7r3t8mjIwO3L
	kmjxhrEs73QyLH/RxW6KYDkxPcJJYCQbuhVTP7s4/uXD1TUjfFpPC30ValsD18bQ2Gp8ffXmJwS
	S55GIC0RGaDDlIe12HHYE2ekrMtaf88xxGF1xM22MyvJlCAnVKuqUYJdC2XxxgEiL8DlAMyFKWI
	KxD/1gN/3PucJAiFc3SYoOMxA+YFgA1QkgszRf/1uXzF6wVoOUeRLR0iV/DEi+R8a4lsjyREo8r
	G8Yg/WWvDy+l1eh/O6gicI5W3Qi5D5sFahMoEFarN3qcO04aMSrsoGK1MSW8uGAN8NHeb5dLH+7
	Cq1RgD9JhieELo731VbAhCb6I/VQhYSXpCHLpN/79E2XYJZ8YC/pgi6WqeuDVPRB6hpx4wg==
X-Received: by 2002:a05:622a:400f:b0:532:86f0:11c7 with SMTP id
 d75a77b69052e-5329e4ceb35mr75300401cf.49.1789783886108; Fri, 18 Sep 2026
 19:11:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: www.rokinthanp03@gmail.com
From: Rokinthan p <rokinthanp03@gmail.com>
Date: Sat, 19 Sep 2026 07:41:09 +0530
X-Gm-Features: AcwNN1VkzL6IMobMvo8w1liGysgH81mbNY8ksVtO4BzLkxYaZxtoMAH5OsaZsC0
Message-ID: <CAHzb5FEYvnXShSCbVSk8BqA77MWTeYbf5zg15XQsZ0L=CUnpHA@mail.gmail.com>
Subject: [PATCH v3] media: v4l2-ctrls: do nothing if controls[0] == NULL in
 cluster functions
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	syzbot+cf896de36144391bcde1@syzkaller.appspotmail.com
Content-Type: multipart/mixed; boundary="000000000000c22f77065bcc889b"

--000000000000c22f77065bcc889b
Content-Type: text/plain; charset="UTF-8"

The V4L2 control framework is designed to allow drivers to instantiate
    controls and clusters without checking for errors after each call,
    checking hdl->error only once at the end.

    However, if allocating the master control (controls[0]) fails, e.g. due to
    memory allocation failure, v4l2_ctrl_cluster() triggers a WARNING:
      ncontrols == 0 || controls[0] == NULL
      WARNING: drivers/media/v4l2-core/v4l2-ctrls-core.c:2525 at
  v4l2_ctrl_cluster

    Additionally, v4l2_ctrl_auto_cluster() attempts to dereference
    master->minimum without checking if controls[0] is NULL, leading to a
    NULL pointer dereference when master control creation fails.

    Update both v4l2_ctrl_cluster() and v4l2_ctrl_auto_cluster() to silently
    return if controls[0] is NULL, preserving the design that control
    creation errors are caught at the end when the driver checks hdl->error.
    Also update function documentation in include/media/v4l2-ctrls.h.

    Fixes: 71c689dc2e73 ("media: v4l2-ctrls: split up into four source files")
    Reported-by: syzbot+cf896de36144391bcde1@syzkaller.appspotmail.com
    Closes: https://syzkaller.appspot.com/bug?extid=cf896de36144391bcde1
    Suggested-by: Hans Verkuil <hverkuil@kernel.org>
    Signed-off-by: Rohinthan <rokinthanp03@gmail.com>
    ---
    v2 -> v3:
    - Fix the issue in the V4L2 core (v4l2-ctrls-core.c) instead of hackrf,
      as suggested by Hans Verkuil.
    - Return early if controls[0] == NULL in both v4l2_ctrl_cluster() and
      v4l2_ctrl_auto_cluster().
    - Update function documentation in include/media/v4l2-ctrls.h.
    - Revert hackrf driver changes.

    v1 -> v2:
    - Corrected commit hash in Fixes tag.

--000000000000c22f77065bcc889b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-media-v4l2-ctrls-do-nothing-if-controls-0-is-NULL-in.patch"
Content-Disposition: attachment; 
	filename="0001-media-v4l2-ctrls-do-nothing-if-controls-0-is-NULL-in.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mu7r39200>
X-Attachment-Id: f_mu7r39200

RnJvbTogUm9oaW50aGFuIDxyb2tpbnRoYW5wMDNAZ21haWwuY29tPgpTdWJqZWN0OiBbUEFUQ0gg
djNdIG1lZGlhOiB2NGwyLWN0cmxzOiBkbyBub3RoaW5nIGlmIGNvbnRyb2xzWzBdID09IE5VTEwg
aW4gY2x1c3RlciBmdW5jdGlvbnMKRGF0ZTogRnJpLCAxMSBTZXAgMjAyNiAxODo1NTowMCArMDUz
MAoKVGhlIFY0TDIgY29udHJvbCBmcmFtZXdvcmsgaXMgZGVzaWduZWQgdG8gYWxsb3cgZHJpdmVy
cyB0byBpbnN0YW50aWF0ZQpjb250cm9scyBhbmQgY2x1c3RlcnMgd2l0aG91dCBjaGVja2luZyBm
b3IgZXJyb3JzIGFmdGVyIGVhY2ggY2FsbCwKY2hlY2tpbmcgaGRsLT5lcnJvciBvbmx5IG9uY2Ug
YXQgdGhlIGVuZC4KCkhvd2V2ZXIsIGlmIGFsbG9jYXRpbmcgdGhlIG1hc3RlciBjb250cm9sIChj
b250cm9sc1swXSkgZmFpbHMsIGUuZy4gZHVlIHRvCm1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmUs
IHY0bDJfY3RybF9jbHVzdGVyKCkgdHJpZ2dlcnMgYSBXQVJOSU5HOgogIG5jb250cm9scyA9PSAw
IHx8IGNvbnRyb2xzWzBdID09IE5VTEwKICBXQVJOSU5HOiBkcml2ZXJzL21lZGlhL3Y0bDItY29y
ZS92NGwyLWN0cmxzLWNvcmUuYzoyNTI1IGF0IHY0bDJfY3RybF9jbHVzdGVyCgpBZGRpdGlvbmFs
bHksIHY0bDJfY3RybF9hdXRvX2NsdXN0ZXIoKSBhdHRlbXB0cyB0byBkZXJlZmVyZW5jZQptYXN0
ZXItPm1pbmltdW0gd2l0aG91dCBjaGVja2luZyBpZiBjb250cm9sc1swXSBpcyBOVUxMLCBsZWFk
aW5nIHRvIGEKTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIHdoZW4gbWFzdGVyIGNvbnRyb2wgY3Jl
YXRpb24gZmFpbHMuCgpVcGRhdGUgYm90aCB2NGwyX2N0cmxfY2x1c3RlcigpIGFuZCB2NGwyX2N0
cmxfYXV0b19jbHVzdGVyKCkgdG8gc2lsZW50bHkKcmV0dXJuIGlmIGNvbnRyb2xzWzBdIGlzIE5V
TEwsIHByZXNlcnZpbmcgdGhlIGRlc2lnbiB0aGF0IGNvbnRyb2wKY3JlYXRpb24gZXJyb3JzIGFy
ZSBjYXVnaHQgYXQgdGhlIGVuZCB3aGVuIHRoZSBkcml2ZXIgY2hlY2tzIGhkbC0+ZXJyb3IuCkFs
c28gdXBkYXRlIGZ1bmN0aW9uIGRvY3VtZW50YXRpb24gaW4gaW5jbHVkZS9tZWRpYS92NGwyLWN0
cmxzLmguCgpGaXhlczogNzFjNjg5ZGMyZTczICgibWVkaWE6IHY0bDItY3RybHM6IHNwbGl0IHVw
IGludG8gZm91ciBzb3VyY2UgZmlsZXMiKQpSZXBvcnRlZC1ieTogc3l6Ym90K2NmODk2ZGUzNjE0
NDM5MWJjZGUxQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KQ2xvc2VzOiBodHRwczovL3N5emth
bGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9Y2Y4OTZkZTM2MTQ0MzkxYmNkZTEKU3VnZ2VzdGVk
LWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFJv
aGludGhhbiA8cm9raW50aGFucDAzQGdtYWlsLmNvbT4KLS0tCnYyIC0+IHYzOgotIEZpeCB0aGUg
aXNzdWUgaW4gdGhlIFY0TDIgY29yZSAodjRsMi1jdHJscy1jb3JlLmMpIGluc3RlYWQgb2YgaGFj
a3JmLAogIGFzIHN1Z2dlc3RlZCBieSBIYW5zIFZlcmt1aWwuCi0gUmV0dXJuIGVhcmx5IGlmIGNv
bnRyb2xzWzBdID09IE5VTEwgaW4gYm90aCB2NGwyX2N0cmxfY2x1c3RlcigpIGFuZAogIHY0bDJf
Y3RybF9hdXRvX2NsdXN0ZXIoKS4KLSBVcGRhdGUgZnVuY3Rpb24gZG9jdW1lbnRhdGlvbiBpbiBp
bmNsdWRlL21lZGlhL3Y0bDItY3RybHMuaC4KLSBSZXZlcnQgaGFja3JmIGRyaXZlciBjaGFuZ2Vz
LgoKdjEgLT4gdjI6Ci0gQ29ycmVjdGVkIGNvbW1pdCBoYXNoIGluIEZpeGVzIHRhZy4KCiBkcml2
ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWN0cmxzLWNvcmUuYyB8IDE2ICsrKysrKysrKysrKy0t
LS0KIGluY2x1ZGUvbWVkaWEvdjRsMi1jdHJscy5oICAgICAgICAgICAgICAgIHwgIDQgKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItY3RybHMtY29yZS5jIGIvZHJpdmVy
cy9tZWRpYS92NGwyLWNvcmUvdjRsMi1jdHJscy1jb3JlLmMKLS0tIGEvZHJpdmVycy9tZWRpYS92
NGwyLWNvcmUvdjRsMi1jdHJscy1jb3JlLmMKKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUv
djRsMi1jdHJscy1jb3JlLmMKQEAgLTI0OTAsNyArMjQ5MCwxMCBAQCB2b2lkIHY0bDJfY3RybF9j
bHVzdGVyKHVuc2lnbmVkIG5jb250cm9scywgc3RydWN0IHY0bDJfY3RybCAqKmNvbnRyb2xzKQog
CWludCBpOwogCiAJLyogVGhlIGZpcnN0IGNvbnRyb2wgaXMgdGhlIG1hc3RlciBjb250cm9sIGFu
ZCBpdCBtdXN0IG5vdCBiZSBOVUxMICovCi0JaWYgKFdBUk5fT04obmNvbnRyb2xzID09IDAgfHwg
Y29udHJvbHNbMF0gPT0gTlVMTCkpCisJaWYgKFdBUk5fT04obmNvbnRyb2xzID09IDApKQorCQly
ZXR1cm47CisKKwlpZiAoIWNvbnRyb2xzWzBdKQogCQlyZXR1cm47CiAKIAlmb3IgKGkgPSAwOyBp
IDwgbmNvbnRyb2xzOyBpKyspIHsKQEAgLTI1MDgsMTIgKzI1MTEsMTcgQEAgRVhQT1JUX1NZTUJP
TCh2NGwyX2N0cmxfY2x1c3Rlcik7CiB2b2lkIHY0bDJfY3RybF9hdXRvX2NsdXN0ZXIodW5zaWdu
ZWQgbmNvbnRyb2xzLCBzdHJ1Y3QgdjRsMl9jdHJsICoqY29udHJvbHMsCiAJCQkgICAgdTggbWFu
dWFsX3ZhbCwgYm9vbCBzZXRfdm9sYXRpbGUpCiB7Ci0Jc3RydWN0IHY0bDJfY3RybCAqbWFzdGVy
ID0gY29udHJvbHNbMF07CisJc3RydWN0IHY0bDJfY3RybCAqbWFzdGVyOwogCXUzMiBmbGFnID0g
MDsKIAlpbnQgaTsKIAorCWlmIChXQVJOX09OKG5jb250cm9scyA8PSAxKSkKKwkJcmV0dXJuOwor
CisJaWYgKCFjb250cm9sc1swXSkKKwkJcmV0dXJuOworCisJbWFzdGVyID0gY29udHJvbHNbMF07
CiAJdjRsMl9jdHJsX2NsdXN0ZXIobmNvbnRyb2xzLCBjb250cm9scyk7Ci0JV0FSTl9PTihuY29u
dHJvbHMgPD0gMSk7CiAJV0FSTl9PTihtYW51YWxfdmFsIDwgbWFzdGVyLT5taW5pbXVtIHx8IG1h
bnVhbF92YWwgPiBtYXN0ZXItPm1heGltdW0pOwogCVdBUk5fT04oc2V0X3ZvbGF0aWxlICYmICFo
YXNfb3AobWFzdGVyLCBnX3ZvbGF0aWxlX2N0cmwpKTsKIAltYXN0ZXItPmlzX2F1dG8gPSB0cnVl
OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9tZWRpYS92NGwyLWN0cmxzLmggYi9pbmNsdWRlL21lZGlh
L3Y0bDItY3RybHMuaAotLS0gYS9pbmNsdWRlL21lZGlhL3Y0bDItY3RybHMuaAorKysgYi9pbmNs
dWRlL21lZGlhL3Y0bDItY3RybHMuaApAQCAtODM0LDYgKzgzNCw4IEBAIHN0cnVjdCB2NGwyX2N0
cmxfY29uZmlnIHsKICAqCiAgKiBAbmNvbnRyb2xzOglUaGUgbnVtYmVyIG9mIGNvbnRyb2xzIGlu
IHRoaXMgY2x1c3Rlci4KICAqIEBjb250cm9sczoJVGhlIGNsdXN0ZXIgY29udHJvbCBhcnJheSBv
ZiBzaXplIEBuY29udHJvbHMuCisgKgorICogSWYgY29udHJvbHNbMF0gaXMgTlVMTCwgdGhlbiB0
aGlzIGZ1bmN0aW9uIGRvZXMgbm90aGluZyBhbmQganVzdCByZXR1cm5zLgogICovCiB2b2lkIHY0
bDJfY3RybF9jbHVzdGVyKHVuc2lnbmVkIGludCBuY29udHJvbHMsIHN0cnVjdCB2NGwyX2N0cmwg
Kipjb250cm9scyk7CiAKQEAgLTg2OCw2ICs4NzAsOCBAQCB2b2lkIHY0bDJfY3RybF9jbHVzdGVy
KHVuc2lnbmVkIGludCBuY29udHJvbHMsIHN0cnVjdCB2NGwyX2N0cmwgKipjb250cm9scyk7CiAg
KiBJbiBhZGRpdGlvbiwgdGhpcyBmdW5jdGlvbiB3aWxsIHNldCB0aGUgJVY0TDJfQ1RSTF9GTEFH
X1VQREFURSBmbGFnCiAgKiBvbiB0aGUgYXV0b2ZvbyBjb250cm9sIGFuZCAlVjRMMl9DVFJMX0ZM
QUdfSU5BQ1RJVkUgb24gdGhlIGZvbyBjb250cm9sKHMpCiAgKiBpZiBhdXRvZm9vIGlzIGluIGF1
dG8gbW9kZS4KKyAqCisgKiBJZiBjb250cm9sc1swXSBpcyBOVUxMLCB0aGVuIHRoaXMgZnVuY3Rp
b24gZG9lcyBub3RoaW5nIGFuZCBqdXN0IHJldHVybnMuCiAgKi8KIHZvaWQgdjRsMl9jdHJsX2F1
dG9fY2x1c3Rlcih1bnNpZ25lZCBpbnQgbmNvbnRyb2xzLAogCQkJICAgIHN0cnVjdCB2NGwyX2N0
cmwgKipjb250cm9scywKLS0gCg==
--000000000000c22f77065bcc889b--
