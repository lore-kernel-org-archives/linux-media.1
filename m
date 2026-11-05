Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872195;
	b=WEk95kOgNmWd/MwB1m8ra4iG2A4qwoLJzlO9iEOvHTAL05Dma93zMdNEAwrtNOnf9cJh
	 Z8/rTlCJFRuvje33T/lygwUKb+b3A3Zw5EkIqyYLnuepNYmgz1slESfqxuRqzGjATOZ4G
	 j2zDs9clMT4/a73u5pFQzbcGO04waQTKVQIfVOfztGrzGXZIdwwblF1NzassUe52ElJjx
	 YhVvv5QIRnqE3M8tykgccM42Rec171GUhIMfjxgn3gj0h7psZSo3FmWBMWQ/Bjkz0R7y4
	 8ZjcLi3SO5ouI83OJKCrcpIMsrx9jeWtQ7lu7UAoC9TuKSwew2F1QWHOXeHgElPY+og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872195;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=EINLgEiBManmYGrhkPGQnJDaa1YpkyEztcgozaDIs8s=;
	b=x1aeoO5bw/OzTWFdLWHzrYHEc122DdJQggWo1qIvMAs3sefsT9BUwXAzDafkPhbc8YwE
	 RzDagnrbhJM+6nhtm8HRu0Yv9yYca5aK1SNFVfMMsIoM/B0nRw3ySltV3pXm6JDKHNMWL
	 LLMwcppuBNxIRdqkyVNNersTs/nvIUwe4EUSvJnLQLP5QxSWTrh6R7EujUalNDEQvarFJ
	 +s+FyaTpNUHSvrywBWWPk9TWTx1VRcOI1ZDmdamWzR7PMlCnt29K6AWC3oXXhsNj0pyfs
	 tbCiHbyjiKMO6WNze03Z3UJxnIn0zBWH5NFWVbOBj/qdMRYyihyE8G4QWYCPGSmj4Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVBkL2kD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3F6606EE86
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVBkL2kD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD481F000C1;
	Thu,  5 Nov 2026 09:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793872195;
	bh=EINLgEiBManmYGrhkPGQnJDaa1YpkyEztcgozaDIs8s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=dVBkL2kDEfHn2Ru4e/lxGbrYBD0vRikutKA+nSar7m3UccMlIl75YukuK9XsjKret
	 61HfPYQH/J809V1llfKhPxgtzEdzHKLyA/8g7V66eWtAfpczG9iI8pESxf2tLlv2ft
	 r1x9+ruQftZwBOrAfsB0Aj24tl9Ep4cJPlEXnLdOTRTr2PyULEKsnKR/dt0ux/EA7a
	 a2lYGYagDLhZcVA2XR8YlXOCbJeE0bCNS8ipOD9+QJuLf/Un+nlYysNVZb8DeAAjAD
	 rQZHoQWYQFDtXBHSf0RCbd1vK8QAMWLmP0QY+xRgzF3Twg5T6V497vPsNWvRTkcMbe
	 bOFR2vMkK7OAA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [yavta] [PATCH] COPYING.GPL: Fix license text to match gnu.org
In-Reply-To: <20261104232353.GC3862409@killaraus.ideasonboard.com>
References: <20261104155613.764306-1-mkorpershoek@kernel.org>
 <20261104232353.GC3862409@killaraus.ideasonboard.com>
Date: Thu, 05 Nov 2026 10:49:52 +0100
Message-ID: <xhkdbqzgzwqtb.fsf@mkorpers-koolstof.csb>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Nov 05, 2026 at 01:23, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Mattijs,
>
> Thank you for the patch.
>
> On Wed, Nov 04, 2026 at 04:56:13PM +0100, Mattijs Korpershoek wrote:
>> When packing this for fedora, rpmlint complains about the license:
>> 
>>   yavta.x86_64: E: incorrect-fsf-address /usr/share/licenses/yavta/COPYING.GPL
>> 
>> Update the license file with the new address. This has been generated
>> with the following command:
>> 
>> $ wget https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt \
>>        -O COPYING.GPL
>
> It matches, so
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> I wonder however what's supposed to be the canonical source of the GPL
> text. libcamera uses the reuse tool to check for license compliance, and
> using "reuse download --all" in yavta gives me a license text that is
> formatted quite differently. Looking at
> https://spdx.org/licenses/GPL-2.0-or-later.html, the license still
> mentions the FSF postal address in the preamble.
>
> What does rmplint consider as the canonical source of the license text ?

I don't think they have a canonical source of license text.

The rpmlint code and it maintains a denylist of "invalid addresses" in
the form of a regex (fsf_wrong_address_regex):
https://github.com/rpm-software-management/rpmlint/blob/main/rpmlint/checks/FilesCheck.py#L21

The denylist matches which is why we get the error.
Since the FSF is remote-office now, rpmlint has a commit that adds
Franklin Street to the denylist:
https://github.com/rpm-software-management/rpmlint/commit/4535df1d7378866ca407e7c65ca33f9bafe4cdf0

This is confirmed by the FSF website:
https://www.fsf.org/about/contact/

So using a web link seems appropriate to me.

>
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
>> ---
>>  COPYING.GPL | 23 +++++++++++------------
>>  1 file changed, 11 insertions(+), 12 deletions(-)
>> 
>> diff --git a/COPYING.GPL b/COPYING.GPL
>> index d511905c1647..9efa6fbc9628 100644
>> --- a/COPYING.GPL
>> +++ b/COPYING.GPL
>> @@ -1,12 +1,12 @@
>> -		    GNU GENERAL PUBLIC LICENSE
>> -		       Version 2, June 1991
>> +                    GNU GENERAL PUBLIC LICENSE
>> +                       Version 2, June 1991
>>  
>>   Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
>> - 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>> + <https://fsf.org/>
>>   Everyone is permitted to copy and distribute verbatim copies
>>   of this license document, but changing it is not allowed.
>>  
>> -			    Preamble
>> +                            Preamble
>>  
>>    The licenses for most software are designed to take away your
>>  freedom to share and change it.  By contrast, the GNU General Public
>> @@ -56,7 +56,7 @@ patent must be licensed for everyone's free use or not licensed at all.
>>    The precise terms and conditions for copying, distribution and
>>  modification follow.
>>  
>> -		    GNU GENERAL PUBLIC LICENSE
>> +                    GNU GENERAL PUBLIC LICENSE
>>     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
>>  
>>    0. This License applies to any program or other work which contains
>> @@ -255,7 +255,7 @@ make exceptions for this.  Our decision will be guided by the two goals
>>  of preserving the free status of all derivatives of our free software and
>>  of promoting the sharing and reuse of software generally.
>>  
>> -			    NO WARRANTY
>> +                            NO WARRANTY
>>  
>>    11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
>>  FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
>> @@ -277,9 +277,9 @@ YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
>>  PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
>>  POSSIBILITY OF SUCH DAMAGES.
>>  
>> -		     END OF TERMS AND CONDITIONS
>> +                     END OF TERMS AND CONDITIONS
>>  
>> -	    How to Apply These Terms to Your New Programs
>> +            How to Apply These Terms to Your New Programs
>>  
>>    If you develop a new program, and you want it to be of the greatest
>>  possible use to the public, the best way to achieve this is to make it
>> @@ -304,8 +304,7 @@ the "copyright" line and a pointer to where the full notice is found.
>>      GNU General Public License for more details.
>>  
>>      You should have received a copy of the GNU General Public License along
>> -    with this program; if not, write to the Free Software Foundation, Inc.,
>> -    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>> +    with this program; if not, see <https://www.gnu.org/licenses/>.
>>  
>>  Also add information on how to contact you by electronic and paper mail.
>>  
>> @@ -329,8 +328,8 @@ necessary.  Here is a sample; alter the names:
>>    Yoyodyne, Inc., hereby disclaims all copyright interest in the program
>>    `Gnomovision' (which makes passes at compilers) written by James Hacker.
>>  
>> -  <signature of Ty Coon>, 1 April 1989
>> -  Ty Coon, President of Vice
>> +  <signature of Moe Ghoul>, 1 April 1989
>> +  Moe Ghoul, President of Vice
>>  
>>  This General Public License does not permit incorporating your program into
>>  proprietary programs.  If your program is a subroutine library, you may
>
> -- 
> Regards,
>
> Laurent Pinchart
